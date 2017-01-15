#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "number.c"
#include "intlist.c"

typedef struct VContext VContext; // map<int,Value*>
typedef struct Continuation Continuation;
typedef struct Value Value;
typedef enum{
		EXP_NUM,
		EXP_ABS,
		EXP_NUMFUNC,
		EXP_NUMFUNC1,
		EXP_INTLIST,
		EXP_SYSCALL, //open close read write getarg system
		EXP_WHNF, // weak head normal form
		EXP_REF,
		EXP_APPLY
	} ExpType;
typedef enum{
		FUNC_ADD,
		FUNC_SUB,
		FUNC_MUL,
		FUNC_DIV,
		FUNC_MOD,
		FUNC_GE,
		FUNC_LE,
		FUNC_NGE,
		FUNC_NLE,
		FUNC_EQ,
		FUNC_NEQ,
		FUNC_BINARY, //binary operations
		FUNC_TOFLOAT,
		FUNC_TOINT
	} FuncType;
typedef enum{
		SYS_EXIT,
		SYS_OPEN,
		SYS_CLOSE,
		SYS_READ,
		SYS_WRITE,
		SYS_PEEK,
		SYS_GETARG,
		SYS_SYSTEM
	} SyscallType;
typedef enum{
		CONT_EVAL,
		CONT_APPLY,
	} ContType;
typedef enum{
		VALUE_RESOLVED,
		VALUE_EXCEPTION,
		VALUE_RUNNING
	} ValueType;
typedef union{
		int int_val;
		IntList * intlist_val;
	} SyscallArg;
typedef struct VExp{
	ExpType type;
    FuncType funcType;
	SyscallType syscallType;
	union{
		Number num_val; //EXP_NUM
		struct VExp * abs_val; //EXP_ABS
		int ref_val; //EXP_REF
		struct{ //EXP_APPLY
			struct VExp * ap_f;
			struct VExp * ap_x;
		};
		struct{ //EXP_NUMFUNC
			FuncType func_type;
		};
		struct{ //EXP_NUMFUNC1
			FuncType func1_type;
			Number func1_opa;
		};
		struct{ //EXP_INTLIST
			IntList * intlist_val;
		};
		struct{ //EXP_SYSCALL
			SyscallType sys_type;
			int sys_nbind;
			SyscallArg sys_arg1;
			int sys_arg2;
			Value * sys_cont;
		};
		struct VExp * pool_next;
	};
	int refcount;
} VExp;
const int syscall_arginfo[8][4]={
{1,0,-1,-1}, // SYS_EXIT   0 = int
{3,1, 0, 2},   //SYS_OPEN,   1 = intlist  2 = cont
{2,0, 2,-1}, //SYS_CLOSE
{2,0, 2,-1}, //SYS_READ,
{3,0, 0, 2}, //SYS_WRITE,
{2,0, 2,-1}, //SYS_PEEK
{1,2,-1,-1}, //SYS_GETARG,
{2,1, 2,-1}  //SYS_SYSTEM
};
struct Value{
	ValueType type;
	union{
		struct{ //VALUE_RESOLVED
			VExp * exp;
			VContext * context;
		};
		const char * message; //VALUE_EXCEPTION
		struct{ //VALUE_RUNNING
			VExp * r_exp;
			VContext * r_context;
			Continuation * r_cont;
		};
		Value * pool_next;
	};
	int refcount;
};
struct Continuation{
	ContType type;
	union{
		struct{ //CONT_EVAL
			VExp * eval_exp;
			VContext * eval_context;
		};
		struct{ //CONT_APPLY
			Value * ap_x; // unresolved
		};
	};
	Continuation * cont;
};
typedef struct ValueStack{
	union{
		struct{
			Value * val;
			struct ValueStack * next;
		};
		struct ValueStack * pool_next;
	};
}ValueStack;
struct VContext{
    Value* val;
    VContext * prev;
    int refcount;
};

//===========================================================
Value * releaseValue(Value *);
VExp * releaseVExp(VExp *);
//===========================================================

VContext * allocateVContext(VContext * p){
	static VContext * pool=NULL;
	if (!p){
		if (!pool){
			VContext * p=(VContext *)malloc(sizeof(VContext)*1000);
			for (int i=0;i<1000;i++){
				p[i].prev=pool;
				pool=p+i;
			}
		}
		p=pool;
		p->refcount=1;
		pool=pool->prev;
		return p;
	}else{
		p->prev=pool;
		pool=p;
		return NULL;
	}
}

VContext * retainVContext(VContext * p){ // p: stolen    returns: new
    if (p){
        p->refcount++;
    }
    return p;
}

VContext * releaseVContext(VContext * p){ // p: consumed
	if (p){
		p->refcount--;
		if (p->refcount==0){
			if (p->prev){
				releaseVContext(p);
			}
			allocateVContext(p);
		}
	}
	return NULL;
}

Value * lookUpRef(int ref,VContext * context){  // context: stolen    returns: stolen
    for (int i=0;i<ref;++i){
        context = context->prev;
    }
	return context->val;
}

VContext * insertRef(Value * v,VContext * context){ // v: consumed   context: consumed   returns: new
    VContext * ncontext=allocateVContext(NULL);
    ncontext->val=v;
    ncontext->prev=context;
    return ncontext;
}

//===========================================================

Continuation * allocateContinuation(Continuation * p){
	static Continuation * pool=NULL;
	if (!p){
		if (!pool){
			Continuation * p=(Continuation *)malloc(sizeof(Continuation)*1000);
			for (int i=0;i<1000;i++){
				p[i].cont=pool;
				pool=p+i;
			}
		}
		p=pool;
		pool=pool->cont;
		return p;
	}else{
		p->cont=pool;
		pool=p;
		return NULL;
	}
}


Continuation * releaseContinuationSingle(Continuation * p){
    if (p){
        if (p->type==CONT_EVAL){
            releaseVExp(p->eval_exp);
            releaseVContext(p->eval_context);
        }else if (p->type==CONT_APPLY){
            releaseValue(p->ap_x);
        }
        allocateContinuation(p);
    }
    return NULL;
}

Continuation * releaseContinuation(Continuation * p){
	while (p){
		Continuation * cont = p->cont;
		releaseContinuationSingle(p);
		p=cont;
    }
    return NULL;
}

//===========================================================

const char * funcNames(FuncType ft){
	static const char * names[]={
		"+",
		"-",
		"*",
		"/",
		"%",
		">",
		"<",
		"<=",
		">=",
		"==",
		"/=",
		"",
		"toFloat",
		"toInt",
	};
	return names[ft];
}
const char * syscallNames(SyscallType st){
	static const char * names[]={
		"exit",
		"openCmd",
		"close",
		"getCharF",
		"putCharF",
		"peekCharF",
		"getArg",
		"systemCmd"
	};
	return names[st];
}

void displayNumber(FILE * fout,Number a){
	if (a.type==NUM_INT){
		fprintf(fout,"%d",a.int_val);
	}else{
		fprintf(fout,"%f",a.double_val);
	}
}

void displayExpRecursive(FILE * fout,VExp * e,int level){ // e : stolen
    if (e->type==EXP_NUM) {
		displayNumber(fout,e->num_val);
    }else if (e->type==EXP_ABS){
		fprintf(fout,"(\\v%d ",level);
		displayExpRecursive(fout,e->abs_val,level+1);
		fprintf(fout,")");
	}else if (e->type==EXP_REF){
		fprintf(fout,"v%d",level-1-e->ref_val);
	}else if (e->type==EXP_APPLY){
		fprintf(fout,"(");
		displayExpRecursive(fout,e->ap_f,level);
		fprintf(fout," ");
		displayExpRecursive(fout,e->ap_x,level);
		fprintf(fout,")");
	}else if (e->type==EXP_NUMFUNC){
		fprintf(fout,"%s",funcNames(e->func_type));
	}else if (e->type==EXP_NUMFUNC1){
		fprintf(fout,"(%s ",funcNames(e->func1_type));
		displayNumber(fout,e->func1_opa);
		fprintf(fout,")");
	}else if (e->type==EXP_INTLIST){
		fprintf(fout,"(makeIntList");
		for (IntList * p=e->intlist_val;p;p=p->next){
			fprintf(fout," %d",p->val);
		}
		fprintf(fout,")");
	}else if (e->type==EXP_SYSCALL){
		if (e->sys_nbind==0){
			fprintf(fout,"%s",syscallNames(e->sys_type));
		}else{
			fprintf(fout,"(%s",syscallNames(e->sys_type));
			int required=syscall_arginfo[e->sys_type][0];
			if (e->sys_nbind>=1 && required>1){
				int atype=syscall_arginfo[e->sys_type][1];
				if (atype==0){
					fprintf(fout," %d",e->sys_arg1.int_val);
				}else{
					fprintf(fout," (makeIntList");
					for (IntList * p=e->sys_arg1.intlist_val;p;p=p->next){
						fprintf(fout," %d",p->val);
					}
					fprintf(fout,")");
				}
			}
			if (e->sys_nbind>=2 && required>2){
				fprintf(fout," %d",e->sys_arg2);
			}
			if (e->sys_nbind>=1 && syscall_arginfo[e->sys_type][e->sys_nbind]==2){
				fprintf(fout," ...");
			}
			fprintf(fout,")");
		}
	}
}

void displayExp(FILE * fout,VExp * e){  // e: stolen
	displayExpRecursive(fout,e,0);
}

VExp * allocateVExp(VExp * p){
	static VExp * pool=NULL;
	if (!p){
		if (!pool){
			VExp * p=(VExp *)malloc(sizeof(VExp)*1000);
			for (int i=0;i<1000;i++){
				p[i].pool_next=pool;
				pool=p+i;
			}
		}
		p=pool;
		p->refcount=1;
		pool=pool->pool_next;
		return p;
	}else{
		p->pool_next=pool;
		pool=p;
		return NULL;
	}
}

VExp * retainVExp(VExp * p){  // p: stolen    returns: new
	if (p){
		p->refcount++;
	}
	return p;
}
VExp * releaseVExp(VExp * p){  // p: consumed   returns: NULL
	if (p){
		p->refcount--;
		if (p->refcount==0){
			if (p->type==EXP_ABS){
				releaseVExp(p->abs_val);
			}else if (p->type==EXP_APPLY){
				releaseVExp(p->ap_f);
				releaseVExp(p->ap_x);
			}else if (p->type==EXP_INTLIST){
				releaseIntList(p->intlist_val);
			}else if (p->type==EXP_SYSCALL){
				if (p->sys_nbind>=1 && syscall_arginfo[p->sys_type][1]==1){
					releaseIntList(p->sys_arg1.intlist_val);
				}
				if (p->sys_nbind==syscall_arginfo[p->sys_type][0] && syscall_arginfo[p->sys_type][p->sys_nbind]==2){
					releaseValue(p->sys_cont);
				}
			}
			allocateVExp(p);
		}
	}
	return NULL;
}

//===========================================================

Value * allocateValue(Value * p){
	static Value * pool=NULL;
	if (!p){
		if (!pool){
			Value * p=(Value *)malloc(sizeof(Value)*1000);
			for (int i=0;i<1000;i++){
				p[i].pool_next=pool;
				pool=p+i;
			}
		}
		p=pool;
		p->refcount=1;
		pool=pool->pool_next;
		return p;
	}else{
		p->pool_next=pool;
		pool=p;
		return NULL;
	}
}

//Value* newValue(){  // returns: new
    //Value * p = allocateValue(NULL);
    //return p;
//}
Value * newResolvedValue(VExp * exp, VContext * context){ // exp : consumed  context : consumed
    Value * p = allocateValue(NULL);
	p->type=VALUE_RESOLVED;
	p->exp=exp;
	p->context=context;
	return p;
}
Value * newRunningValue(VExp * r_exp,VContext * r_context){ // r_exp : consumed    r_context : consumed
    Value * p = allocateValue(NULL);
	p->type=VALUE_RUNNING;
	p->r_exp=r_exp;
	p->r_context=r_context;
	p->r_cont=NULL;
	return p;
}

Value * releaseValue(Value * p){ // p: consumed
    if (p){
        p->refcount--;
        if (p->refcount==0){
            if (p->type==VALUE_RESOLVED){
                releaseVExp(p->exp);
                releaseVContext(p->context);
            } else if (p->type==VALUE_RUNNING){
                releaseVExp(p->r_exp);
                releaseVContext(p->r_context);
                releaseContinuation(p->r_cont);
            } else if (p->type==VALUE_EXCEPTION){

            }
            allocateValue(p);
        }
    }
    return NULL;
}

Value * retainValue(Value * p){ // p: consumed   returns: new
    if (p){
        p->refcount++;
    }
    return p;
}

//modifiers for Running Value
void pushEvalContinuation(Value * v,VExp * exp,VContext * context){ // v : stolen  exp : consumed   context : consumed
    Continuation * p = allocateContinuation(NULL);
	p->type=CONT_EVAL;
	p->eval_exp=exp;
	p->eval_context=context;
	p->cont=v->r_cont;
	v->r_cont=p;
}
void pushApplyContinuation(Value * v,Value * ap_x){ // v: stolen    ap_x : consumed
    Continuation * p = allocateContinuation(NULL);
	p->type=CONT_APPLY;
	p->ap_x=ap_x;
	p->cont=v->r_cont;
	v->r_cont=p;
}
void popContinuation(Value * v){ // v : stolen
	Continuation * r=v->r_cont->cont;
	releaseContinuationSingle(v->r_cont);
	v->r_cont=r;
}
void clearNullContinuation(Value * v){ // v : stolen
	VExp * exp=v->r_exp;
	VContext * context=v->r_context;
	// v->r_cont must be NULL
	v->type=VALUE_RESOLVED;
	v->exp=exp;
	v->context=context;
}
void setRunningValue(Value * v,VExp * exp,VContext * context){ // v : stolen   exp : consumed  context : consumed
	releaseVExp(v->r_exp);
	v->r_exp=exp;
	releaseVContext(v->r_context);
	v->r_context=context;
}
void setExceptionValue(Value * v,const char * message){ // v : stolen
	v->r_exp=releaseVExp(v->r_exp);
	v->r_context=releaseVContext(v->r_context);
	v->r_cont=releaseContinuation(v->r_cont);
	v->type=VALUE_EXCEPTION;
	v->message=message;
}

//===========================================================

ValueStack * allocateValueStack(ValueStack * p){
	static ValueStack * pool=NULL;
	if (!p){
		if (!pool){
			ValueStack * p=(ValueStack *)malloc(sizeof(ValueStack)*1000);
			for (int i=0;i<1000;i++){
				p[i].pool_next=pool;
				pool=p+i;
			}
		}
		p=pool;
		pool=pool->pool_next;
		return p;
	}else{
		p->pool_next=pool;
		pool=p;
		return NULL;
	}
}

ValueStack * pushValueStack(Value * v,ValueStack * r){ // v : stolen
    ValueStack * p = allocateValueStack(NULL);
	p->next=r;
	p->val=v;
    return p;
}
ValueStack * popValueStack(ValueStack * p){
	ValueStack * r=p->next;
	allocateValueStack(p);
	return r;
}

VExp * newVExpNum(Number num_val){ //returns: new
	VExp * p=allocateVExp(NULL);
	p->type=EXP_NUM;
	p->num_val=num_val;
	return p;
}
VExp * newVExpAbs(VExp * abs_val){ //abs_val: consumed   returns: new
	VExp * p=allocateVExp(NULL);
	p->type=EXP_ABS;
	p->abs_val=abs_val;
	return p;
}
VExp * newVExpRef(int ref_val){ //returns: new
	VExp * p=allocateVExp(NULL);
	p->type=EXP_REF;
	p->ref_val=ref_val;
	return p;
}
VExp * newVExpApply(VExp * ap_f,VExp * ap_x){ // ap_f: consumed   ap_x: consumed   returns: new
	VExp * p=allocateVExp(NULL);
	p->type=EXP_APPLY;
	p->ap_f=ap_f;
	p->ap_x=ap_x;
	return p;
}
VExp * newVExpNumfunc(FuncType func_type){ //returns: new
	VExp * p=allocateVExp(NULL);
	p->type=EXP_NUMFUNC;
	p->func_type=func_type;
	return p;
}
VExp * newVExpNumfunc1(FuncType func1_type,Number func1_opa){ //returns: new
	VExp * p=allocateVExp(NULL);
	p->type=EXP_NUMFUNC1;
	p->func1_type=func1_type;
	p->func1_opa=func1_opa;
	return p;
}
VExp * newVExpIntList(IntList * intlist_val){ //intlist_val: consumed    returns: new
	VExp * p=allocateVExp(NULL);
	p->type=EXP_INTLIST;
	p->intlist_val=intlist_val;
	return p;
}
VExp * newVExpSyscall0(SyscallType sys_type){//returns: new
	VExp * p=allocateVExp(NULL);
	p->type=EXP_SYSCALL;
	p->sys_type=sys_type;
	p->sys_nbind=0;
	return p;
}
VExp * appendSyscallArg(VExp * exp,Value * x,const char ** error_message,Value ** to_resolve){ // exp: stolen   x: stolen    returns: new    to_resolve[0]: stolen
	error_message[0]=NULL;
	to_resolve[0]=NULL;
	int nrequired=syscall_arginfo[exp->sys_type][0];
	if (nrequired<=exp->sys_nbind){
		error_message[0]="too many arguments to syscall";
		return NULL;
	}else{
		int argid=exp->sys_nbind;
		int argtype=syscall_arginfo[exp->sys_type][1+argid];
		if (argtype!=2){
			if (x->type!=VALUE_RESOLVED && x->type!=VALUE_EXCEPTION){
				to_resolve[0]=x;
				return NULL;
			}
		}
		if (argtype==0){
			if (x->exp->type!=EXP_NUM || x->exp->num_val.type!=NUM_INT){
				error_message[0]="cannot apply non-integer value to syscall";
				return NULL;
			}
		}else if (argtype==1){
			if (x->exp->type!=EXP_INTLIST){
				error_message[0]="cannot apply non-intlist value to syscall";
				return NULL;
			}
		}//else argtype=2
		VExp * nexp=allocateVExp(NULL);
		nexp->type=EXP_SYSCALL;
		nexp->sys_type=exp->sys_type;
		nexp->sys_nbind=exp->sys_nbind+1;
		if (exp->sys_nbind>0){
			int atype=syscall_arginfo[exp->sys_type][1+0];
			if (atype==0){
				nexp->sys_arg1.int_val=exp->sys_arg1.int_val;
			}else if (atype==1){
				nexp->sys_arg1.intlist_val=retainIntList(exp->sys_arg1.intlist_val);
			}
		}
		if (exp->sys_nbind>1){
			int atype=syscall_arginfo[exp->sys_type][1+1];
			if (atype==0){
				nexp->sys_arg2=exp->sys_arg2;
			}
		}
		if (argtype==2){
			nexp->sys_cont=retainValue(x);
		}else{
			if (exp->sys_nbind==0){
				if (argtype==0){
					nexp->sys_arg1.int_val=x->exp->num_val.int_val;
				}else{ //argtype==1
					nexp->sys_arg1.intlist_val=retainIntList(x->exp->intlist_val);
				}
			}else if (exp->sys_nbind==1){
				if (argtype==0){
					nexp->sys_arg2=x->exp->num_val.int_val;
				}
			}
		}
		return nexp;
	}
}

VExp * constructBoolExp(bool v){ //returns : new
	static VExp * p_true=NULL,*p_false=NULL;
	if (v){
		if (!p_true){
			p_true=newVExpAbs(
				newVExpAbs(
					newVExpRef(1)
				)
			);
		}
		return retainVExp(p_true);
	}else{
		if (!p_false){
			p_false=newVExpAbs(
				newVExpAbs(
					newVExpRef(0)
				)
			);
		}
		return retainVExp(p_false);
	}
}

void incCounter(){
	static long count=0,unit=1<<18;
	count++;
	if (!(count&(unit-1))){
		fprintf(stderr,"count=%ld\n",count);
		if ((unit<<4) <=count){
			unit<<=1;
		}
	}
}

Value * resolveValue(Value * v){ // v : stolen    returns: stolen
	//hit count 146800640
	
	//v->type must be VALUE_RUNNING
	Continuation * cont=v->r_cont;
	if (!cont){
		//hit count  9437184
		
		clearNullContinuation(v);
	}else if (cont->type==CONT_EVAL){
		//hit count 83886080
		
		//v->r_exp and v->r_context should be NULL
		VExp * exp=cont->eval_exp; // stolen
		VContext * context=cont->eval_context; //stolen
		if (exp->type<EXP_WHNF){
			//hit count 2359296
			
			setRunningValue(v,
				retainVExp(exp),
				retainVContext(context)
			);
			popContinuation(v);
		}if (exp->type==EXP_REF){
			//hit count 33554432
			
			int ref=exp->ref_val;
			Value * ref_val=lookUpRef(ref,context); // stolen
			if (ref_val->type==VALUE_RESOLVED){
				setRunningValue(v,
					retainVExp(ref_val->exp),
					retainVContext(ref_val->context)
				);
				popContinuation(v);
			}else if(ref_val->type==VALUE_EXCEPTION){
				setExceptionValue(v,ref_val->message);
			}else{
				//hit count 6815744
				
				return ref_val;
			}
		}else if (exp->type==EXP_APPLY){
			//hit count 46137344
			
			VExp * f=retainVExp(exp->ap_f); //new
			VContext * fcontext=retainVContext(context);
			VExp * x=exp->ap_x; //stolen
			VContext * xcontext=context;

			Value * nvx;
			if (x->type < EXP_WHNF){
				//hit count 6815744
				nvx = newResolvedValue(retainVExp(x),retainVContext(xcontext));
			}else if(x->type == EXP_REF){
				//hit count 29360128
				nvx=retainValue(lookUpRef(x->ref_val,xcontext));
			}else{
				//hit count 10485760
				nvx=newRunningValue(NULL,NULL);
				pushEvalContinuation(nvx,
					retainVExp(x),
					retainVContext(xcontext)
				);
			}

			setRunningValue(v,NULL,NULL);
			popContinuation(v);
			pushApplyContinuation(v,nvx);
			pushEvalContinuation(v,f,fcontext);
		}
	}else if (cont->type==CONT_APPLY){
		//hitcount 50331648
		
		VExp * exp=v->r_exp; //stolen
		VContext * context=v->r_context; //stolen
		Value * x = cont->ap_x; //stolen
		if (exp->type==EXP_NUM){
			setExceptionValue(v,
				"cannot use numeric value as function"
			);
		}else if (exp->type==EXP_ABS){
			//hit count 37748736
			
            VContext * ncontext=insertRef(
				retainValue(x),
				retainVContext(context)
			); //new 
			VExp * nexp=retainVExp(exp->abs_val);
			if (nexp->type < EXP_WHNF){
				setRunningValue(v,nexp,ncontext);
				popContinuation(v);
			}else{
				setRunningValue(v,NULL,NULL);
				popContinuation(v);
				pushEvalContinuation(v,nexp,ncontext);
			}
		}else if (exp->type==EXP_NUMFUNC){
			//hit count 3932160

			if (x->type!=VALUE_RESOLVED && x->type!=VALUE_EXCEPTION){
				return x;
			}
			if (x->type==VALUE_EXCEPTION){
				setExceptionValue(v,x->message);
			}else if (x->exp->type!=EXP_NUM){
				setExceptionValue(v,
					"cannot apply built-in function on non-numeric value"
				);
			}else{
				VExp * nexp=NULL;
				if (exp->func_type<FUNC_BINARY){
					nexp=newVExpNumfunc1(
						exp->func_type,
						x->exp->num_val
					);
				}else if (exp->func_type==FUNC_TOINT){
					if (x->exp->num_val.type==NUM_INT){
						nexp=retainVExp(x->exp);
					}else{ // must be double
						nexp=newVExpNum(
							intNumber(floor(x->exp->num_val.double_val))
						);
					}
				}else if (exp->func_type==FUNC_TOFLOAT){
					if (x->exp->num_val.type==NUM_DOUBLE){
						nexp=retainVExp(x->exp);
					}else{ // must be int
						nexp=newVExpNum(
							doubleNumber((double)(x->exp->num_val.int_val))
						);
					}
				} // cannot be else
				//nexp : new
				setRunningValue(v,
					nexp,
					NULL
				);
				popContinuation(v);
			}
		}else if (exp->type==EXP_NUMFUNC1){
			//hit count 4718592
			
			if (x->type!=VALUE_RESOLVED && x->type!=VALUE_EXCEPTION){
				return x;
			}
			if (x->type==VALUE_EXCEPTION){
				setExceptionValue(v,x->message);
			}else if (x->exp->type!=EXP_NUM){
				setExceptionValue(v,
					"cannot apply built-in function on non-numeric value"
				);
			}else{
				const char * exception_message=NULL;
				Number result;
				bool is_bool=false,result_bool;
				if (exp->func1_type==FUNC_ADD){
					result=addNumber(exp->func1_opa,x->exp->num_val);
				}else if (exp->func1_type==FUNC_SUB){
					result=subNumber(exp->func1_opa,x->exp->num_val);
				}else if (exp->func1_type==FUNC_MUL){
					result=mulNumber(exp->func1_opa,x->exp->num_val);
				}else if (exp->func1_type==FUNC_DIV){
					result=divNumber(exp->func1_opa,x->exp->num_val,&exception_message);
				}else if (exp->func1_type==FUNC_MOD){
					result=modNumber(exp->func1_opa,x->exp->num_val,&exception_message);
				}else{
					is_bool=true;
					if (exp->func1_type==FUNC_LE){
						result_bool=leNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==FUNC_GE){
						result_bool=geNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==FUNC_NLE){
						result_bool=nleNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==FUNC_NGE){
						result_bool=ngeNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==FUNC_EQ){
						result_bool=eqNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==FUNC_NEQ){
						result_bool=neqNumber(exp->func1_opa,x->exp->num_val);
					}
				}
				if (exception_message!=NULL){
					setExceptionValue(v,exception_message);
				}else{
					VExp * nexp=NULL;
					if (is_bool){
						nexp=constructBoolExp(result_bool);
					}else{
						nexp=newVExpNum(
							result
						);
					}
					//nexp : new
					setRunningValue(v,
						nexp,
						NULL
					);
					popContinuation(v);
				}
			}
		}else if (exp->type==EXP_INTLIST){
			if (x->type!=VALUE_RESOLVED && x->type!=VALUE_EXCEPTION){
				return x;
			}
			if (x->type==VALUE_EXCEPTION){
				setExceptionValue(v,x->message);
			}else if (x->exp->type!=EXP_NUM){
				setExceptionValue(v,
					"cannot apply built-in function on non-numeric value"
				);
			}else if (x->exp->num_val.type!=NUM_INT){
				setExceptionValue(v,
						"cannot append non-integer number to IntList"
				);
			}else{
				VExp * nexp=newVExpIntList(
					newIntList(
						x->exp->num_val.int_val,
						retainIntList(exp->intlist_val)
					)
				);
				setRunningValue(v,nexp,NULL);
				popContinuation(v);
			}
		}else if (exp->type==EXP_SYSCALL){
			Value * to_resolve;
			const char * error_message;
			VExp * nexp=appendSyscallArg(exp,x,&error_message,&to_resolve); // new
			if (!nexp){
				if (error_message){
					setExceptionValue(v,error_message);
				}else if (to_resolve){
					return to_resolve;
				}
			}else{
				setRunningValue(v,nexp,NULL);
				popContinuation(v);
			}
		}// else   impossible
	}
	return NULL;
}
void resolveAllValue(Value * v){ // v : stolen
	ValueStack * head=pushValueStack(v,NULL);
	//head stores a list of stolen Value*
	while (head){
		if (head->val->type!=VALUE_RESOLVED && head->val->type!=VALUE_EXCEPTION){
			Value * depends=resolveValue(head->val);
			if (depends!=NULL && depends!=head->val){
				head=pushValueStack(depends,head);
			}
		}else{
			head=popValueStack(head);
		}
	}
}


int executeValue(Value * v,int argc,char ** args){ // v: consumed
	int cur_argi=1;
	char * cur_arg=NULL;
	if (argc>1){
		cur_arg=args[cur_argi];
	}
	FILE ** files;
	int files_buflen;
	files=(FILE**)malloc(sizeof(FILE*)*2);
	files[0]=stdin;
	files[1]=stdout;
	files_buflen=2;
	int exitcode=0;
	while (true){
		if (v->type!=VALUE_RESOLVED && v->type!=VALUE_EXCEPTION){
			resolveAllValue(v);
		}
		if (v->type==VALUE_EXCEPTION){
			printf("exception: %s\n",v->message);
			exitcode=1;
			break;
		}
		if (v->exp->type!=EXP_SYSCALL){
			displayExp(stdout,v->exp);
			puts("");
			exitcode=0;
			break;
		}
		int nrequired=syscall_arginfo[v->exp->sys_type][0];
		if (nrequired>v->exp->sys_nbind){
			printf("exception: insufficient arguments to syscall\n");
			exitcode=1;
			break;
		}
		int resultcode=0;
		if (v->exp->sys_type==SYS_EXIT){
			exitcode=v->exp->sys_arg1.int_val;
			break;
		}else if (v->exp->sys_type==SYS_OPEN){
			int mode=v->exp->sys_arg2;
			//efOpenModes = [ReadMode,WriteMode,AppendMode,ReadWriteMode]
			const char * open_mode;
			if (mode==0){
				open_mode="rb";
			}else if (mode==1){
				open_mode="wb";
			}else if (mode==2){
				open_mode="ab";
			}else if (mode==3){
				open_mode="rwb";
			}else{
				resultcode=-2;
				open_mode=NULL;
			}
			if (open_mode){
				char * filename=convertIntListToString(v->exp->sys_arg1.intlist_val);
				FILE * f=fopen(filename,open_mode);
				free(filename);
				if (!f){
					resultcode=-1;
				}else{
					int position=-1;
					for (int i=0;i<files_buflen;i++){
						if (files[i]==NULL){
							position=i;
							break;
						}
					}
					if (position==-1){
						FILE ** nfiles=(FILE**)realloc(files,sizeof(FILE*)*files_buflen*2);
						for (int i=0;i<files_buflen;i++){
							nfiles[i]=files[i];
						}
						for (int i=0;i<files_buflen;i++){
							nfiles[i+files_buflen]=NULL;
						}
						position=files_buflen;
						files_buflen*=2;
						files=nfiles;
					}
					files[position]=f;
					resultcode=position;
				}
			}
		}else if (v->exp->sys_type==SYS_READ){
			int fileid=v->exp->sys_arg1.int_val;
			if (fileid<0 || fileid>=files_buflen || files[fileid]==NULL){
				resultcode=-2;
			}else{
				FILE * fin=files[fileid];
				resultcode=fgetc(fin);
			}
		}else if (v->exp->sys_type==SYS_WRITE){
			int fileid=v->exp->sys_arg1.int_val;
			if (fileid<0 || fileid>=files_buflen || files[fileid]==NULL){
				resultcode=-2;
			}else{
				FILE * fout=files[fileid];
				resultcode=fputc(v->exp->sys_arg2,fout);
				if (resultcode==EOF)
                    resultcode=1;
                else resultcode=0;
			}
        }else if (v->exp->sys_type==SYS_PEEK){
			int fileid=v->exp->sys_arg1.int_val;
			if (fileid<0 || fileid>=files_buflen || files[fileid]==NULL){
				resultcode=-2;
			}else{
				FILE * fin=files[fileid];
				resultcode=fgetc(fin);
				if (resultcode!=EOF)
                    ungetc(resultcode,fin);
			}
		}else if (v->exp->sys_type==SYS_GETARG){
			if (cur_argi<argc && cur_arg[0]!=0){
				resultcode=cur_arg[0];
				cur_arg++;
			}else if (cur_argi<argc && cur_arg[0]==0){
				resultcode=0;
				cur_argi++;
				if (cur_argi<argc)
					cur_arg=args[cur_argi];
			}else{
				resultcode=-1;
			}
			printf("%d\n", resultcode);
		}else if (v->exp->sys_type==SYS_CLOSE){
			int fileid=v->exp->sys_arg1.int_val;
			if (fileid<0 || fileid>=files_buflen || files[fileid]==NULL){
				resultcode=-2;
			}else{
				resultcode=fclose(files[fileid]);
				files[fileid]=NULL;
			}
		}else if (v->exp->sys_type==SYS_SYSTEM){
			char * filename=convertIntListToString(v->exp->sys_arg1.intlist_val);
			resultcode=system(filename);
			free(filename);
		}//else    other syscall
		Value * sys_cont=v->exp->sys_cont; //stolen
		resolveAllValue(sys_cont);
		if (sys_cont->type==VALUE_EXCEPTION){
			sys_cont=retainValue(sys_cont);
			releaseValue(v);
			v=sys_cont;
		}else{
			Value * rv=newResolvedValue(
				newVExpNum(intNumber(resultcode)),
				NULL
			);
			Value * nv=newRunningValue(
				retainVExp(sys_cont->exp),
				retainVContext(sys_cont->context)
			);
			pushApplyContinuation(nv,rv);
			releaseValue(v);
			v=nv;
		}
	}
	releaseValue(v);
	free(files);
	return exitcode;
}

VExp * makeApply(VExp * f,VExp * x){ //f : consumed  x : consumed   return : new
    return newVExpApply(f,x);
}

VExp * makeInt(int a){ // return : new
    Number num_val;
    num_val.type = NUM_INT;
    num_val.int_val = a;
    return newVExpNum(num_val);
}

VExp * makeDouble(double a){ // return : new
    Number num_val;
    num_val.type = NUM_DOUBLE;
    num_val.double_val = a;
    return newVExpNum(num_val);
}

VExp * makeAbs(VExp* abs_val){ //abs_val : consumed   return : new
    return newVExpAbs(abs_val);
}

VExp * makeRef(int ref_val){  //return: new
    return newVExpRef(ref_val);
}

VExp * makeBuiltin(const char* func_name){ //return: new
    if (strcmp(func_name,"+")==0){
        return newVExpNumfunc(FUNC_ADD);
    }else if (strcmp(func_name,"-")==0){
        return newVExpNumfunc(FUNC_SUB);
    }else if (strcmp(func_name,"*")==0){
        return newVExpNumfunc(FUNC_MUL);
    }else if (strcmp(func_name,"/")==0){
        return newVExpNumfunc(FUNC_DIV);
    }else if (strcmp(func_name,"%")==0){
        return newVExpNumfunc(FUNC_MOD);
    }else if (strcmp(func_name,"<")==0){
        return newVExpNumfunc(FUNC_LE);
    }else if (strcmp(func_name,">=")==0){
        return newVExpNumfunc(FUNC_NLE);
    }else if (strcmp(func_name,">")==0){
        return newVExpNumfunc(FUNC_GE);
    }else if (strcmp(func_name,"<=")==0){
       return newVExpNumfunc(FUNC_NGE);
    }else if (strcmp(func_name,"/=")==0){
        return newVExpNumfunc(FUNC_NEQ);
    }else if (strcmp(func_name,"=")==0){
        return newVExpNumfunc(FUNC_EQ);
    }else if (strcmp(func_name,"toInt")==0){
        return newVExpNumfunc(FUNC_TOINT);
    }else if (strcmp(func_name,"toFloat")==0){
        return newVExpNumfunc(FUNC_TOFLOAT);
    }else if (strcmp(func_name,"exit")==0){
        return newVExpSyscall0(SYS_EXIT);
    }else if (strcmp(func_name,"putChar")==0){
        return newVExpApply(newVExpSyscall0(SYS_WRITE),makeInt(1));
    }else if (strcmp(func_name,"putCharF")==0){
        return newVExpSyscall0(SYS_WRITE);
    }else if (strcmp(func_name,"getChar")==0){
        return newVExpApply(newVExpSyscall0(SYS_READ),makeInt(0));
    }else if (strcmp(func_name,"getCharF")==0){
        return newVExpSyscall0(SYS_READ);
    }else if (strcmp(func_name,"peekChar")==0){
        return newVExpApply(newVExpSyscall0(SYS_PEEK),makeInt(0));
    }else if (strcmp(func_name,"peekCharF")==0){
        return newVExpSyscall0(SYS_PEEK);
    }else if (strcmp(func_name,"close")==0){
        return newVExpSyscall0(SYS_CLOSE);
    }else if (strcmp(func_name,"openCmd")==0){
        return newVExpSyscall0(SYS_OPEN);
    }else if (strcmp(func_name,"makeIntList")==0){
        return newVExpIntList(NULL);
    }else if (strcmp(func_name,"getArg")==0){
        return newVExpSyscall0(SYS_GETARG);
    }else if (strcmp(func_name,"systemCmd")==0){
        return newVExpSyscall0(SYS_SYSTEM);
    }else return NULL;
}

int executeVExp(VExp * exp,int argc,char ** argv){ // exp : consumed
	Value * v=newRunningValue(NULL,NULL); // new
	pushEvalContinuation(v,
		exp, //exp is consumed here
		NULL);
	printf("%s\n", argv[0]);
    return executeValue(v,argc,argv); // v is consumed here
}

/*int main(int argc,char ** argv){
return executeVExp(makeApply(
makeAbs(
makeRef(0)),
makeApply(
makeApply(
makeBuiltin("putChar"),
makeInt(67)),
makeBuiltin("exit"))),argc,argv);
}*/

