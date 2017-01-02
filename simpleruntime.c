#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "number.c"
#include "intlist.c"

typedef struct VContext VContext; // map<int,LazyValue*>
typedef struct Continuation Continuation; 
typedef struct Value Value; 
typedef struct VExp{ 
	enum{
		EXP_NUM,
		EXP_ABS,
		EXP_NUMFUNC,
		EXP_NUMFUNC1,
		EXP_INTLIST,
		EXP_SYSCALL, //open close read write getarg system
		EXP_WHNF, // weak head normal form
		EXP_REF,
		EXP_APPLY
	}type;
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
		SYS_GETARG,
		SYS_SYSTEM
	} SyscallType;
	typedef union{
		int int_val;
		IntList* intlist_val;
	} SyscallArg;
	union{
		Number num_val; //EXP_NUM
		VExp * abs_val; //EXP_ABS
		int ref_val; //EXP_REF
		struct{ //EXP_APPLY
			VExp * ap_f;
			VExp * ap_x;
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
		VExp * pool_next;
	};
	int refcount;
} VExp;
const int syscall_arginfo[7][4]={
{2,0,-1,-1}, // SYS_EXIT   0 = int
{3,1, 0, 2},   //SYS_OPEN,   1 = intlist  2 = cont
{2,0, 2,-1}, //SYS_CLOSE
{2,0, 2,-1}, //SYS_READ,
{3,0, 0, 2}, //SYS_WRITE,
{1,2,-1,-1}, //SYS_GETARG,
{2,1, 2,-1}  //SYS_SYSTEM
};
struct Value{
	enum{
		VALUE_RESOLVED,
		VALUE_EXCEPTION,
		VALUE_RUNNING
	}type;
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
	};
};
struct Continuation{
	enum{
		CONT_EVAL,
		CONT_APPLY,
	}type;
	union{
		struct{ //CONT_EVAL
			VExp * eval_exp;
			VContext * eval_context;
		};
		struct{ //CONT_APPLY
			Value * ap_x; // unresolved
		};
		Continuation * cont;
	};
};

Value * newValue();
Value * retainValue(Value * p);
Value * releaseValue(Value* p);
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
			if (p->type==p->EXP_ABS){
				releaseVExp(p->abs_val);
			}else if (p->type==p->EXP_APPLY){
				releaseVExp(p->ap_f);
				releaseVExp(p->ap_x);
			}else if (p->type==p->EXP_INTLIST){
				releaseIntList(p->intlist_val);
			}else if (p->type==p->EXP_SYSCALL){
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
VExp * newVExpNum(Number num_val){ //returns: new
	VExp * p=allocateVExp(NULL);
	p->type=p->EXP_NUM;
	p->num_val=num_val;
	return p;
}
VExp * newVExpAbs(VExp * abs_val){ //abs_val: consumed   returns: new
	VExp * p=allocateVExp(NULL);
	p->type=p->EXP_ABS;
	p->abs_val=abs_val;
	return p;
}
VExp * newVExpRef(int ref_val){ //returns: new
	VExp * p=allocateVExp(NULL);
	p->type=p->EXP_REF;
	p->ref_val=ref_val;
	return p;
}
VExp * newVExpApply(VExp * ap_f,VExp * ap_x){ // ap_f: consumed   ap_x: consumed   returns: new
	VExp * p=allocateVExp(NULL);
	p->type=p->EXP_APPLY;
	p->ap_f=ap_f;
	p->ap_x=ap_x;
	return p;
}
VExp * newVExpNumfunc(VExp::FuncType func_type){ //returns: new
	VExp * p=allocateVExp(NULL);
	p->type=p->EXP_NUMFUNC;
	p->func_type=func_type;
	return p;
}
VExp * newVExpNumfunc1(VExp::FuncType func1_type,Number func1_opa){ //returns: new
	VExp * p=allocateVExp(NULL);
	p->type=p->EXP_NUMFUNC1;
	p->func1_type=func1_type;
	p->func1_opa=func1_opa;
	return p;
}
VExp * newVExpIntList(IntList * intlist_val){ //intlist_val: consumed    returns: new
	VExp * p=allocateVExp(NULL);
	p->type=p->EXP_INTLIST;
	p->intlist_val=intlist_val;
	return p;
}
VExp * newVExpSyscall0(VExp::SyscallType sys_type){//returns: new
	VExp * p=allocateVExp(NULL);
	p->type=p->EXP_SYSCALL;
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
			if (x->type!=x->VALUE_RESOLVED && x->type!=x->VALUE_EXCEPTION){
				to_resolve[0]=x;
				return NULL;
			}
		}
		if (argtype==0){
			if (x->exp->type!=x->exp->EXP_NUM || x->exp->num_val.type!=x->exp->num_val.NUM_INT){
				error_message[0]="cannot apply non-integer value to syscall";
				return NULL;
			}
		}else if (argtype==1){
			if (x->exp->type!=x->exp->EXP_INTLIST){
				error_message[0]="cannot apply non-intlist value to syscall";
				return NULL;
			}
		}//else argtype=2
		VExp * nexp=allocateVExp(NULL);
		nexp->type=nexp->EXP_SYSCALL;
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

typedef struct ValueStack{
	Value * val;
	ValueStack * next;
}ValueStack;

Continuation * newContinuation();
ValueStack * newValueStack();
VContext * retainVContext(VContext * context);
Value * lookUpRef(int ref,VContext* context);
VContext * insertRef(Value*,VContext* context);
void displayExp(VExp * e);

Value* resolveValue(Value * v){ // v : stolen    returns: stolen
	//v->type must be VALUE_RUNNING
	Continuation * cont=v->r_cont;
	if (!cont){
		VExp * exp=v->r_exp;
		VContext * context=v->r_context;
		v->type=v->VALUE_RESOLVED;
		v->exp=exp;
		v->context=context;
	}else if (cont->type==cont->CONT_EVAL){
		VExp * exp=cont->eval_exp;
		VContext * context=cont->eval_context;
		if (exp->type<exp->EXP_WHNF){
			Continuation * ncont=cont->cont;
			v->type=v->VALUE_RUNNING;
			v->r_exp=retainVExp(exp);
			v->r_context=retainVContext(context);
			v->r_cont=ncont;
		}if (exp->type==exp->EXP_REF){
			int ref=exp->ref_val;
			Value * ref_val=lookUpRef(ref,context);
			if (ref_val->type==ref_val->VALUE_RESOLVED){
				v->r_exp=retainVExp(ref_val->exp);
				v->r_context=retainVContext(ref_val->context);
				v->r_cont=cont->cont;
			}else if(ref_val->type==ref_val->VALUE_EXCEPTION){
				v->type=v->VALUE_EXCEPTION;
				v->message=ref_val->message;
			}else{
				return ref_val;
			}
		}else if (exp->type==exp->EXP_APPLY){
			VExp * f=exp->ap_f;
			VExp * x=exp->ap_x;
			Value * nvx=newValue();
			nvx->type=nvx->VALUE_RUNNING;
			nvx->r_exp=NULL;
			nvx->r_context=NULL;
			nvx->r_cont=newContinuation();
			nvx->r_cont->type=nvx->r_cont->CONT_EVAL;
			nvx->r_cont->eval_exp=x;
			nvx->r_cont->eval_context=context;
			nvx->r_cont->cont=NULL;
			Continuation * ncont=newContinuation();
			ncont->type=ncont->CONT_APPLY;
			ncont->cont=cont->cont;
			ncont->ap_x=nvx;
			cont->type=cont->CONT_EVAL;
			cont->eval_exp=f;
			cont->eval_context=context;
			cont->cont=ncont;
			v->r_exp=NULL;
			v->r_context=NULL;
		}
	}else if (cont->type==cont->CONT_APPLY){
		VExp * exp=v->r_exp;
		VContext * context=v->r_context;
		Value * x = cont->ap_x;
		if (exp->type==exp->EXP_NUM){
			v->type=v->VALUE_EXCEPTION;
			v->message="cannot use numeric value as function";
		}else if (exp->type==exp->EXP_ABS){
			VContext * ncontext=insertRef(x,context);
			cont->type=cont->CONT_EVAL;
			cont->eval_exp=exp;
			cont->eval_context=ncontext;
			v->r_exp=NULL;
			v->r_context=NULL;
		}else if (exp->type==exp->EXP_NUMFUNC){
			if (x->type!=x->VALUE_RESOLVED && x->type!=x->VALUE_EXCEPTION){
				return x;
			}
			if (x->type==x->VALUE_EXCEPTION){
				const char * message=x->message;
				v->type=v->VALUE_EXCEPTION;
				v->message=message;
			}else if (x->exp->type!=x->exp->EXP_NUM){
				v->type=v->VALUE_EXCEPTION;
				v->message="cannot apply built-in function on non-numeric value";
			}else{
				VExp * nexp=NULL;
				if (exp->func_type<exp->FUNC_BINARY){
					nexp=newVExpNumfunc1(
						exp->func_type,
						x->exp->num_val
					);
				}else if (exp->func_type==exp->FUNC_TOINT){
					if (x->exp->num_val.type==x->exp->num_val.NUM_INT){
						nexp=retainVExp(x->exp);
					}else{ // must be double

						nexp=newVExpNum(
							intNumber(floor(exp->num_val.double_val))
						);
					}
				}else if (exp->func_type==exp->FUNC_TOFLOAT){
					if (x->exp->num_val.type==x->exp->num_val.NUM_DOUBLE){
						nexp=retainVExp(x->exp);
					}else{ // must be int
						nexp=newVExpNum(
							doubleNumber((double)(exp->num_val.int_val))
						);
					}
				} // cannot be else
				Continuation * ncont=cont->cont;
				v->r_exp=nexp;
				v->r_context=NULL;
				v->r_cont=ncont;
			}
		}else if (exp->type==exp->EXP_NUMFUNC1){
			if (x->type!=x->VALUE_RESOLVED && x->type!=x->VALUE_EXCEPTION){
				return x;
			}
			if (x->type==x->VALUE_EXCEPTION){
				const char * message=x->message;
				v->type=v->VALUE_EXCEPTION;
				v->message=message;
			}else if (x->exp->type!=x->exp->EXP_NUM){
				v->type=v->VALUE_EXCEPTION;
				v->message="cannot apply built-in function on non-numeric value";
			}else{
				const char * exception_message=NULL;
				Number result;
				bool is_bool=false,result_bool;
				if (exp->func1_type==exp->FUNC_ADD){
					result=addNumber(exp->func1_opa,x->exp->num_val);
				}else if (exp->func1_type==exp->FUNC_SUB){
					result=subNumber(exp->func1_opa,x->exp->num_val);
				}else if (exp->func1_type==exp->FUNC_MUL){
					result=mulNumber(exp->func1_opa,x->exp->num_val);
				}else if (exp->func1_type==exp->FUNC_DIV){
					result=divNumber(exp->func1_opa,x->exp->num_val,&exception_message);
				}else if (exp->func1_type==exp->FUNC_MOD){
					result=divNumber(exp->func1_opa,x->exp->num_val,&exception_message);
				}else{
					is_bool=true;
					if (exp->func1_type==exp->FUNC_LE){
						result_bool=leNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==exp->FUNC_GE){
						result_bool=geNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==exp->FUNC_NLE){
						result_bool=nleNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==exp->FUNC_NGE){
						result_bool=ngeNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==exp->FUNC_EQ){
						result_bool=eqNumber(exp->func1_opa,x->exp->num_val);
					}else if (exp->func1_type==exp->FUNC_NEQ){
						result_bool=neqNumber(exp->func1_opa,x->exp->num_val);
					}
				}
				if (exception_message!=NULL){
					v->type=v->VALUE_EXCEPTION;
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
					v->r_exp=nexp;
					v->r_context=NULL;
					v->r_cont=ncont;
				}
			}
		}else if (exp->type==exp->EXP_INTLIST){
			if (x->type!=x->VALUE_RESOLVED && x->type!=x->VALUE_EXCEPTION){
				return x;
			}
			if (x->type==x->VALUE_EXCEPTION){
				const char * message=x->message;
				v->type=v->VALUE_EXCEPTION;
				v->message=message;
			}else if (x->exp->type!=x->exp->EXP_NUM){
				v->type=v->VALUE_EXCEPTION;
				v->message="cannot apply built-in function on non-numeric value";
			}else if (x->exp->num_val.type!=x->exp->num_val.NUM_INT){
				v->type=v->VALUE_EXCEPTION;
				v->message="cannot append non-integer number to IntList";
			}else{
				VExp * nexp=newVExpIntList(
					newIntList(
						x->exp->num_val.int_val,
						retainIntList(exp->intlist_val)
					)
				);
				Continuation * ncont=cont->cont;
				v->r_exp=nexp;
				v->r_context=NULL;
				v->r_cont=ncont;
			}
		}else if (exp->type==exp->EXP_SYSCALL){
			Value * to_resolve;
			const char * error_message;
			VExp * nexp=appendSyscallArg(exp,x,&error_message,&to_resolve);
			if (!nexp){
				if (error_message){
					v->type=v->VALUE_EXCEPTION;
					v->message=error_message;
				}else if (to_resolve){
					return to_resolve;
				}
			}else{
				Continuation * ncont=cont->cont;
				v->r_exp=nexp;
				v->r_context=context;
				v->r_cont=ncont;
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
		if (head->val->type!=head->val->VALUE_RESOLVED && head->val->type!=head->val->VALUE_RUNNING){
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
		if (v->type!=v->VALUE_RESOLVED && v->type!=v->VALUE_RUNNING){
			resolveAllValue(v);
		}
		if (v->type==v->VALUE_EXCEPTION){
			printf("exception: %s\n",v->message);
			exitcode=1;
			break;
		}
		if (v->exp->type!=v->exp->EXP_SYSCALL){
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
		if (v->exp->sys_type==v->exp->SYS_EXIT){
			exitcode=v->exp->sys_arg1.int_val;
			break;
		}else if (v->exp->sys_type==v->exp->SYS_OPEN){
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
						files=(FILE**)realloc(files,sizeof(FILE*)*files_buflen*2);
						for (int i=0;i<files_buflen;i++){
							files[i]=NULL;
						}
						position=files_buflen;
						files_buflen*=2;
					}
					resultcode=position;
				}
			}
		}else if (v->exp->sys_type==v->exp->SYS_READ){
			int fileid=v->exp->sys_arg1.int_val;
			if (fileid<0 || fileid>=files_buflen || files[fileid]==NULL){
				resultcode=-2;
			}else{
				FILE * fin=files[fileid];
				resultcode=fgetc(fin);
			}
		}else if (v->exp->sys_type==v->exp->SYS_WRITE){
			int fileid=v->exp->sys_arg1.int_val;
			if (fileid<0 || fileid>=files_buflen || files[fileid]==NULL){
				resultcode=-2;
			}else{
				FILE * fout=files[fileid];
				resultcode=fputc(v->exp->sys_arg2,fout);
			}
		}else if (v->exp->sys_type==v->exp->SYS_GETARG){
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
		}else if (v->exp->sys_type==v->exp->SYS_CLOSE){
			int fileid=v->exp->sys_arg1.int_val;
			if (fileid<0 || fileid>=files_buflen || files[fileid]==NULL){
				resultcode=-2;
			}else{
				resultcode=fclose(files[fileid]);
				files[fileid]=NULL;
			}
		}else if (v->exp->sys_type==v->exp->SYS_SYSTEM){
			char * filename=convertIntListToString(v->exp->sys_arg1.intlist_val);
			resultcode=system(filename);
			free(filename);
		}//else    other syscall
		Value * sys_cont=v->exp->sys_cont;
		resolveAllValue(sys_cont);
		if (sys_cont->type==sys_cont->VALUE_EXCEPTION){
			v=sys_cont;
		}else{
			Value * rv=newValue();
			rv->type=rv->VALUE_RESOLVED;
			rv->exp=newVExpNum(
				intNumber(resultcode)
			);
			rv->context=NULL;
			Continuation * ncont=newContinuation();
			ncont->type=ncont->CONT_APPLY;
			ncont->ap_x=rv;
			ncont->cont=NULL;
			Value * nv=newValue();
			nv->type=nv->VALUE_RUNNING;
			nv->r_exp=sys_cont->exp;
			nv->r_context=sys_cont->context;
			nv->r_cont=ncont;
			v=nv;
		}
	}
	free(files);
	return exitcode;
}

int main()
{
	return 0;
}

