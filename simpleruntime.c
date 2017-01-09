#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "number.c"
#include "intlist.c"

typedef struct VContext VContext; // map<int,LazyValue*>
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
		//
	};
	Continuation * cont;
};
typedef struct ValueStack{
	Value * val;
	struct ValueStack * next;
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

VContext * newVContext(){
    VContext * p = allocateVContext(NULL);
    p->prev = NULL;
    p->val = NULL;
    return p;
}

VContext * retainVContext(VContext * p){
    if (p){
        p->refcount++;
    }
    return p;
}

VContext * releaseVContext(VContext * p){
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

Value * lookUpRef(int ref,VContext * context){
    for (int i=0;i<ref;++i){
        context = context->prev;
    }
    return context->val;
}

VContext * insertRef(Value * v,VContext * context){
    VContext * ncontext=newVContext();
    ncontext->val=v;
    ncontext->prev=retainVContext(context);
    VContext * p=context;
    /*while (p){
        retainVContext(p);
        p = p->prev;
    }*/
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

Continuation * newContinuation(){
    Continuation * p = allocateContinuation(NULL);
    p->cont=NULL;
    return p;
}

Continuation * releaseContinuation(Continuation * p){
    if (p){
        if (p->type==CONT_EVAL){
            releaseVExp(p->eval_exp);
            releaseVContext(p->eval_context);
        }else if (p->type==CONT_APPLY){
            releaseValue(p->ap_x);
        }
        if (p->cont){
            releaseContinuation(p->cont);
        }
        allocateContinuation(p);
    }
    return NULL;
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

//===========================================================

void displayExp(VExp * e){
    if (e->type==EXP_NUM) {
        Number num_val = e->num_val;
        if (num_val.type==NUM_INT){
            printf("%d\n",num_val.int_val);
        }else{
            printf("%f\n",num_val.double_val);
        }
    }else {
        printf("Not a number\n");
    }
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

Value* newValue(){
    Value * p = allocateValue(NULL);
    p->type = VALUE_RUNNING;
    return p;
}

Value * releaseValue(Value * p){
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
        }
        allocateValue(p);
    }
    return NULL;
}

Value * retainValue(Value * p){
    if (p){
        p->refcount++;
    }
    return p;
}

//===========================================================

ValueStack * newValueStack(){
    ValueStack * p = malloc(sizeof(ValueStack));
    p->next = NULL;
    p->val = NULL;
    return p;
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

Value * resolveValue(Value * v){ // v : stolen    returns: stolen
	//v->type must be VALUE_RUNNING
	Continuation * cont=v->r_cont;
	if (!cont){
		VExp * exp=v->r_exp;
		VContext * context=v->r_context;
		releaseContinuation(v->r_cont);
		v->type=VALUE_RESOLVED;
		v->exp=exp;
		v->context=context;
	}else if (cont->type==CONT_EVAL){
		VExp * exp=cont->eval_exp;
		VContext * context=cont->eval_context;
		if (exp->type<EXP_WHNF){
			Continuation * ncont=cont->cont;
			v->type=VALUE_RUNNING;
			v->r_exp=retainVExp(exp);
			v->r_context=retainVContext(context);
			v->r_cont=ncont;
			releaseContinuationSingle(cont);
		}if (exp->type==EXP_REF){
			int ref=exp->ref_val;
			Value * ref_val=lookUpRef(ref,context);
			if (ref_val->type==VALUE_RESOLVED){
				v->r_exp=retainVExp(ref_val->exp);
				v->r_context=retainVContext(ref_val->context);
				v->r_cont=cont->cont;
				releaseContinuationSingle(cont);
			}else if(ref_val->type==VALUE_EXCEPTION){
				v->type=VALUE_EXCEPTION;
				v->message=ref_val->message;
			}else{
				return ref_val;
			}
		}else if (exp->type==EXP_APPLY){
			VExp * f=exp->ap_f;
			VExp * x=exp->ap_x;
			Value * nvx=newValue();
			nvx->type=VALUE_RUNNING;
			nvx->r_exp=NULL;
			nvx->r_context=NULL;
			nvx->r_cont=newContinuation();
			nvx->r_cont->type=CONT_EVAL;
			nvx->r_cont->eval_exp=retainVExp(x);
			nvx->r_cont->eval_context=retainVContext(context);
			nvx->r_cont->cont=NULL;
			Continuation * ncont=newContinuation();
			ncont->type=CONT_APPLY;
			ncont->cont=cont->cont;
			ncont->ap_x=nvx;
			Continuation * ncont2=newContinuation();
			ncont2->type=CONT_EVAL;
			ncont2->eval_exp=retainVExp(f);
			ncont2->eval_context=retainVContext(context);
			ncont2->cont=ncont;
			v->r_exp=releaseVExp(v->r_exp);
			v->r_context=releaseVContext(v->r_context);
			releaseContinuationSingle(cont);
			v->r_cont=ncont2;
		}
	}else if (cont->type==CONT_APPLY){
		VExp * exp=v->r_exp;
		VContext * context=v->r_context;
		Value * x = cont->ap_x;
		if (exp->type==EXP_NUM){
			v->type=VALUE_EXCEPTION;
			v->message="cannot use numeric value as function";
		}else if (exp->type==EXP_ABS){
            VContext * ncontext=insertRef(x ,context);
			cont->type=CONT_EVAL;
			cont->eval_exp=retainVExp(exp->abs_val);
			cont->eval_context=ncontext;
			v->r_exp=releaseVExp(v->r_exp);
			v->r_context=releaseVContext(v->r_context);
		}else if (exp->type==EXP_NUMFUNC){
			if (x->type!=VALUE_RESOLVED && x->type!=VALUE_EXCEPTION){
				return x;
			}
			if (x->type==VALUE_EXCEPTION){
				const char * message=x->message;
				v->type=VALUE_EXCEPTION;
				v->message=message;
			}else if (x->exp->type!=EXP_NUM){
				v->type=VALUE_EXCEPTION;
				v->message="cannot apply built-in function on non-numeric value";
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
				Continuation * ncont=cont->cont;
				v->r_exp=nexp;
				v->r_context=releaseVContext(v->r_context);
				v->r_cont=ncont;
				releaseContinuationSingle(cont);
			}
		}else if (exp->type==EXP_NUMFUNC1){
			if (x->type!=VALUE_RESOLVED && x->type!=VALUE_EXCEPTION){
				return x;
			}
			if (x->type==VALUE_EXCEPTION){
				const char * message=x->message;
				v->type=VALUE_EXCEPTION;
				v->message=message;
			}else if (x->exp->type!=EXP_NUM){
				v->type=VALUE_EXCEPTION;
				v->message="cannot apply built-in function on non-numeric value";
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
					v->type=VALUE_EXCEPTION;
					v->message=exception_message;
				}else{
					VExp * nexp=NULL;
					if (is_bool){
						int ref;
						if (result_bool){
							ref=1;
						}else{
							ref=0;
						}
						nexp=newVExpAbs(
							newVExpAbs(
								newVExpRef(
									ref
								)
							)
						);
					}else{
						nexp=newVExpNum(
							result
						);
					}
					Continuation * ncont=cont->cont;
					releaseVExp(v->r_exp);
					v->r_exp=nexp;
					v->r_context=releaseVContext(v->r_context);
					v->r_cont=ncont;
					releaseContinuationSingle(cont);
				}
			}
		}else if (exp->type==EXP_INTLIST){
			if (x->type!=VALUE_RESOLVED && x->type!=VALUE_EXCEPTION){
				return x;
			}
			if (x->type==VALUE_EXCEPTION){
				const char * message=x->message;
				v->type=VALUE_EXCEPTION;
				v->message=message;
			}else if (x->exp->type!=EXP_NUM){
				v->type=VALUE_EXCEPTION;
				v->message="cannot apply built-in function on non-numeric value";
			}else if (x->exp->num_val.type!=NUM_INT){
				v->type=VALUE_EXCEPTION;
				v->message="cannot append non-integer number to IntList";
			}else{
				VExp * nexp=newVExpIntList(
					newIntList(
						x->exp->num_val.int_val,
						retainIntList(exp->intlist_val)
					)
				);
				Continuation * ncont=cont->cont;
				releaseVExp(v->r_exp);
				v->r_exp=nexp;
				v->r_context=releaseVContext(v->r_context);
				v->r_cont=ncont;
				releaseContinuationSingle(cont);
			}
		}else if (exp->type==EXP_SYSCALL){
			Value * to_resolve;
			const char * error_message;
			VExp * nexp=appendSyscallArg(exp,x,&error_message,&to_resolve);
			if (!nexp){
				if (error_message){
					v->type=VALUE_EXCEPTION;
					v->message=error_message;
				}else if (to_resolve){
					return to_resolve;
				}
			}else{
				Continuation * ncont=cont->cont;
				releaseVExp(v->r_exp);
				v->r_exp=nexp;
				v->r_context=context;
				v->r_cont=ncont;
				//releaseContinuationSingle(cont);
			}
		}// else   other expression types
	}
	return NULL;
}
void resolveAllValue(Value * v){
	ValueStack * head=newValueStack();
	head->val=v;
	head->next=NULL;
	while (head){
		if (head->val->type!=VALUE_RESOLVED && head->val->type!=VALUE_EXCEPTION){
			Value * depends=resolveValue(head->val);
			if (depends!=NULL && depends!=head->val){
				ValueStack *nhead=newValueStack();
				nhead->val=depends;
				nhead->next=head;
				head=nhead;
			}
		}else{
			head=head->next;
		}
	}
}


int executeValue(Value * v,int argc,char ** args){
	int cur_argi=0;
	char * cur_arg=NULL;
	if (argc>0){
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
			displayExp(v->exp);
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
		Value * sys_cont=v->exp->sys_cont;
		resolveAllValue(sys_cont);
		if (sys_cont->type==VALUE_EXCEPTION){
			v=sys_cont;
		}else{
			Value * rv=newValue();
			rv->type=VALUE_RESOLVED;
			rv->exp=newVExpNum(
				intNumber(resultcode)
			);
			rv->context=NULL;
			Continuation * ncont=newContinuation();
			ncont->type=CONT_APPLY;
			ncont->ap_x=rv;
			ncont->cont=NULL;
			Value * nv=newValue();
			nv->type=VALUE_RUNNING;
			nv->r_exp=sys_cont->exp;
			nv->r_context=sys_cont->context;
			nv->r_cont=ncont;
			v=nv;
		}
	}
	free(files);
	return exitcode;
}

VExp * makeApply(VExp * f,VExp * x){
    return newVExpApply(f,x);
}

VExp * makeInt(int a){
    Number num_val;
    num_val.type = NUM_INT;
    num_val.int_val = a;
    return newVExpNum(num_val);
}

VExp * makeDouble(double a){
    Number num_val;
    num_val.type = NUM_DOUBLE;
    num_val.double_val = a;
    return newVExpNum(num_val);
}

VExp * makeAbs(VExp* abs_val){
    return newVExpAbs(abs_val);
}

VExp * makeRef(int ref_val){
    return newVExpRef(ref_val);
}

//unfinished
VExp * makeBuiltin(const char* func_name){
    FuncType func_type;
    SyscallType syscall_type;
    bool isFunc = false;
    bool isSyscall = false;
    if (strcmp(func_name,"+")==0){
        func_type = FUNC_ADD;
        isFunc = true;
    }else if (strcmp(func_name,"-")==0){
        func_type = FUNC_SUB;
        isFunc = true;
    }else if (strcmp(func_name,"*")==0){
        func_type = FUNC_MUL;
        isFunc = true;
    }else if (strcmp(func_name,"/")==0){
        func_type = FUNC_DIV;
        isFunc = true;
    }else if (strcmp(func_name,"%")==0){
        func_type = FUNC_MOD;
        isFunc = true;
    }else if (strcmp(func_name,"<")==0){
        func_type = FUNC_LE;
        isFunc = true;
    }else if (strcmp(func_name,">=")==0){
        func_type = FUNC_NLE;
        isFunc = true;
    }else if (strcmp(func_name,">")==0){
        func_type = FUNC_GE;
        isFunc = true;
    }else if (strcmp(func_name,"<=")==0){
        func_type = FUNC_NGE;
        isFunc = true;
    }else if (strcmp(func_name,"/=")==0){
        func_type = FUNC_NEQ;
        isFunc = true;
    }else if (strcmp(func_name,"=")==0){
        func_type = FUNC_EQ;
        isFunc = true;
    }else if (strcmp(func_name,"toInt")==0){
        func_type = FUNC_TOINT;
        isFunc = true;
    }else if (strcmp(func_name,"toFloat")==0){
        func_type = FUNC_TOFLOAT;
        isFunc = true;
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
    }


    if (isFunc){
        return newVExpNumfunc(func_type);
    }
    if (isSyscall){
        return newVExpSyscall0(syscall_type);
    }
    return NULL;
}

int executeVExp(VExp * exp,int argc,char ** argv){
    Value * v = newValue();
    VContext * context = newVContext();
    Continuation * cont = newContinuation();
    cont->type = CONT_EVAL;
    cont->eval_exp = exp;
    cont->eval_context = context;
    v->r_exp = NULL;
    v->r_context = NULL;
    v->r_cont = cont;
    return executeValue(v,argc,argv);
}

/*{
    int resultcode =executeVExp(makeApply(
makeAbs(
makeRef(0)),
makeApply(
makeApply(
makeBuiltin("systemCmd"),
makeApply(
makeApply(
makeBuiltin("makeIntList"),
makeInt(115)),
makeInt(108))),
makeAbs(
makeApply(
makeBuiltin("exit"),
makeInt(0))))));


    //printf("\nhere\n");
    //printf("%d",resultcode);

}*/

