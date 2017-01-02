#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "number.c"

typedef struct VContext VContext; // map<int,LazyValue*>
typedef struct Continuation Continuation; 
typedef struct Value Value; 
typedef struct IntList{
	int val;
	IntList * next;
}IntList;
IntList * newIntList();
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
		int ref; //EXP_REF
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
	};
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
			Value * r_val;
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
typedef struct ValueStack{
	Value * val;
	ValueStack * next;
}ValueStack;

Value * newValue();
Continuation * newContinuation();
ValueStack * newValueStack();
VExp * newVExp();
Value * lookUpRef(int ref,VContext* context);
VContext * insertRef(Value*,VContext* context);
void displayExp(VExp * e);

Value* resolveValue(Value * v){
	//v->type must be VALUE_RUNNING
	Value * val=v->r_val;
	Continuation * cont=v->r_cont;
	if (!cont){
		if (val->type==val->VALUE_EXCEPTION){
			const char * message=val->message;
			v->type=v->VALUE_EXCEPTION;
			v->message=message;
		}else{
			VExp * exp=val->exp;
			VContext * context=val->context;
			v->type=v->VALUE_RESOLVED;
			v->exp=exp;
			v->context=context;
		}
	}else if (cont->type==cont->CONT_EVAL){
		VExp * exp=cont->eval_exp;
		VContext * context=cont->eval_context;
		if (exp->type<exp->EXP_WHNF){
			Value * nv=newValue();
			nv->type=nv->VALUE_RESOLVED;
			nv->exp=exp;
			nv->context=context;
			v->r_val=nv;
			v->r_cont=cont->cont;
		}if (exp->type==exp->EXP_REF){
			int ref=exp->ref;
			Value * ref_val=lookUpRef(ref,context);
			if (ref_val->type==ref_val->VALUE_RESOLVED || ref_val->type==ref_val->VALUE_EXCEPTION){
				v->r_val=ref_val;
				v->r_cont=cont->cont;
			}else{
				return ref_val;
			}
		}else if (exp->type==exp->EXP_APPLY){
			VExp * f=exp->ap_f;
			VExp * x=exp->ap_x;
			Value * nvx=newValue();
			nvx->type=nvx->VALUE_RUNNING;
			nvx->r_val=NULL;
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
			v->r_val=NULL;
		}
	}else if (cont->type==cont->CONT_APPLY){
		if (val->type==val->VALUE_EXCEPTION){
			v->r_cont=cont->cont;
		}else{
			VExp * exp=val->exp;
			VContext * context=val->context;
			Value * x = cont->ap_x;
			if (exp->type==exp->EXP_NUM){
				Value * nv=newValue();
				nv->type=nv->VALUE_EXCEPTION;
				nv->message="cannot use numeric value as function";
				v->r_val=nv;
				v->r_cont=cont->cont;
			}else if (exp->type==exp->EXP_ABS){
				VContext * ncontext=insertRef(x,context);
				cont->type=cont->CONT_EVAL;
				cont->eval_exp=exp;
				cont->eval_context=ncontext;
				v->r_val=NULL;
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
						nexp=newVExp();
						nexp->type=nexp->EXP_NUMFUNC1;
						nexp->func_type=exp->func_type;
						nexp->func1_opa=x->exp->num_val;
					}else if (exp->func_type==exp->FUNC_TOINT){
						if (x->exp->num_val.type==x->exp->num_val.NUM_INT){
							nexp=x->exp;
						}else{ // must be double
							nexp=newVExp();
							nexp->type=nexp->EXP_NUM;
							nexp->num_val.type=nexp->num_val.NUM_INT;
							nexp->num_val.int_val=(int)(floor(exp->num_val.double_val));
						}
					}else if (exp->func_type==exp->FUNC_TOFLOAT){
						if (x->exp->num_val.type==x->exp->num_val.NUM_DOUBLE){
							nexp=x->exp;
						}else{ // must be int
							nexp=newVExp();
							nexp->type=nexp->EXP_NUM;
							nexp->num_val.type=nexp->num_val.NUM_DOUBLE;
							nexp->num_val.int_val=(double)(exp->num_val.int_val);
						}
					} // cannot be else
					Value * nv=newValue();
					nv->type=nv->VALUE_RESOLVED;
					nv->exp=nexp;
					nv->context=NULL;
					Continuation * ncont=cont->cont;
					v->r_val=nv;
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
							nexp=newVExp();
							nexp->type=nexp->EXP_ABS;
							nexp->abs_val=newVExp();
							nexp->abs_val->type=nexp->EXP_ABS;
							nexp->abs_val->abs_val=newVExp();
							nexp->abs_val->abs_val->type=nexp->EXP_REF;
							if (result_bool){
								nexp->abs_val->abs_val->ref=1;
							}else{
								nexp->abs_val->abs_val->ref=0;
							}
						}else{
							nexp=newVExp();
							nexp->type=nexp->EXP_NUM;
							nexp->num_val=result;
						}
						VContext * context=NULL;
						Value * nv=newValue();
						nv->type=nv->VALUE_RESOLVED;
						nv->exp=nexp;
						nv->context=context;
						Continuation * ncont=cont->cont;
						v->r_val=nv;
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
					VExp * nexp=newVExp();
					nexp->type=nexp->EXP_INTLIST;
					nexp->intlist_val=newIntList();
					nexp->intlist_val->val=x->exp->num_val.int_val;
					nexp->intlist_val->next=exp->intlist_val;
					VContext * context=NULL;
					Value * nv=newValue();
					nv->type=nv->VALUE_RESOLVED;
					nv->exp=nexp;
					nv->context=context;
					Continuation * ncont=cont->cont;
					v->r_val=nv;
					v->r_cont=ncont;
				}
			}else if (exp->type==exp->EXP_SYSCALL){
				int nrequired=syscall_arginfo[exp->sys_type][0];
				if (nrequired<=exp->sys_nbind){
					v->type=v->VALUE_EXCEPTION;
					v->message="too many arguments to syscall";
				}else{
					int argid=exp->sys_nbind;
					int argtype=syscall_arginfo[exp->sys_type][argid];
					if (argtype!=2){
						if (x->type!=x->VALUE_RESOLVED && x->type!=x->VALUE_EXCEPTION){
							return x;
						}
					}
					bool error_happened=false;
					if (argtype==0){
						if (x->exp->type!=x->exp->EXP_NUM || x->exp->num_val.type!=x->exp->num_val.NUM_INT){
							v->type=v->VALUE_EXCEPTION;
							v->message="cannot apply non-integer value to syscall";
							error_happened=true;
						}
					}else if (argtype==1){
						if (x->exp->type!=x->exp->EXP_INTLIST){
							v->type=v->VALUE_EXCEPTION;
							v->message="cannot apply non-intlist value to syscall";
							error_happened=true;
						}
					}//else argtype=2
					if (!error_happened){
						VExp * nexp=newVExp();
						nexp->sys_type=exp->sys_type;
						nexp->sys_nbind=exp->sys_nbind+1;
						if (exp->sys_nbind>0){
							int atype=syscall_arginfo[exp->sys_type][0];
							if (atype==0){
								nexp->sys_arg1.int_val=exp->sys_arg1.int_val;
							}else if (atype==1){
								nexp->sys_arg1.intlist_val=exp->sys_arg1.intlist_val;
							}
						}
						if (exp->sys_nbind>1){
							nexp->sys_arg2=exp->sys_arg2;
						}
						if (argtype==2){
							nexp->sys_cont=x;
						}else{
							if (exp->sys_nbind==0){
								if (argtype==0){
									nexp->sys_arg1.int_val=x->exp->num_val.int_val;
								}else{ //argtype==1
									nexp->sys_arg1.intlist_val=x->exp->intlist_val;
								}
							}else if (exp->sys_nbind==1){
								if (argtype==0){
									nexp->sys_arg2=x->exp->num_val.int_val;
								}
							}
						}
					}
				}
			}// else   other expression types
		}
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

char * convertIntListToString(IntList* list);

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
			rv->exp=newVExp();
			rv->exp->type=rv->exp->EXP_NUM;
			rv->exp->num_val.type=rv->exp->num_val.NUM_INT;
			rv->exp->num_val.int_val=resultcode;
			rv->context=NULL;
			Continuation * ncont=newContinuation();
			ncont->type=ncont->CONT_APPLY;
			ncont->ap_x=rv;
			ncont->cont=NULL;
			Value * nv=newValue();
			nv->type=nv->VALUE_RUNNING;
			nv->r_val=sys_cont;
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

