#include <stdlib.h>
typedef struct IntList{
	int val;
	struct IntList * next;
	int refcount;
}IntList;
IntList * allocateIntList(IntList * p){
	static IntList * pool=NULL;
	if (!p){
		if (!pool){
			IntList * p=(IntList*)malloc(sizeof(IntList)*1000);
			for (int i=0;i<1000;i++){
				p[i].next=pool;
				pool=p+i;
			}
		}
		p=pool;
		pool=pool->next;
		return p;
	}else{
		p->next=pool;
		p->refcount=1;
		pool=p;
		return NULL;
	}
}
IntList * retainIntList(IntList * p){  // p: stolen    returns: new
	if (p){
		p->refcount++;
	}
	return p;
}
IntList * releaseIntList(IntList * p){  // p: consumed   returns: NULL
	if (p){
		p->refcount--;
		if (p->refcount==0){
			if (p->next){
				releaseIntList(p);
			}
			allocateIntList(p);
		}
	}
	return NULL;
}
IntList * newIntList(int val,IntList * nxt){  // nxt: consumed     returns: new
	IntList * p=allocateIntList(NULL);
	p->val=val;
	p->next=nxt;
	return p;
}
char * convertIntListToString(IntList * list){ // l: stolen   returns: new
	int l=0;
	for (IntList * p=list;p;p=p->next){
		l++;
	}
	char * s=(char*)malloc(l+1);
	int i=0;
	for (IntList * p=list;p;p=p->next){
		s[i]=p->val;
		i++;
	}
	s[i]=0;
	return s;
}
