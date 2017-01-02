typedef struct Number{
	enum{
		NUM_INT,
		NUM_DOUBLE
	}type; // 0 -> int   1 -> double
	union{
		double double_val;
		int int_val;
	};
} Number;
Number addNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			Number c;
			c.type=c.NUM_INT;
			c.int_val=a.int_val+b.int_val;
			return c;
		}else{ //NUM_DOUBLE
			Number c;
			c.type=c.NUM_DOUBLE;
			c.double_val=a.int_val+b.double_val;
			return c;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			Number c;
			c.type=c.NUM_DOUBLE;
			c.int_val=a.double_val+b.int_val;
			return c;
		}else{ //NUM_DOUBLE
			Number c;
			c.type=c.NUM_DOUBLE;
			c.double_val=a.double_val+b.double_val;
			return c;
		}
	}
}
Number subNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			Number c;
			c.type=c.NUM_INT;
			c.int_val=a.int_val-b.int_val;
			return c;
		}else{ //NUM_DOUBLE
			Number c;
			c.type=c.NUM_DOUBLE;
			c.double_val=a.int_val-b.double_val;
			return c;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			Number c;
			c.type=c.NUM_DOUBLE;
			c.int_val=a.double_val-b.int_val;
			return c;
		}else{ //NUM_DOUBLE
			Number c;
			c.type=c.NUM_DOUBLE;
			c.double_val=a.double_val-b.double_val;
			return c;
		}
	}
}
Number mulNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			Number c;
			c.type=c.NUM_INT;
			c.int_val=a.int_val*b.int_val;
			return c;
		}else{ //NUM_DOUBLE
			Number c;
			c.type=c.NUM_DOUBLE;
			c.double_val=a.int_val*b.double_val;
			return c;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			Number c;
			c.type=c.NUM_DOUBLE;
			c.int_val=a.double_val*b.int_val;
			return c;
		}else{ //NUM_DOUBLE
			Number c;
			c.type=c.NUM_DOUBLE;
			c.double_val=a.double_val*b.double_val;
			return c;
		}
	}
}
Number divNumber(Number a,Number b,const char ** msg){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			Number c;
			if (b.int_val==0){
				msg[0]="divided by zero";
			}else{
				c.type=c.NUM_INT;
				c.int_val=a.int_val/b.int_val;
			}
			return c;
		}else{ //NUM_DOUBLE
			Number c;
			c.type=c.NUM_DOUBLE;
			c.double_val=a.int_val/b.double_val;
			return c;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			Number c;
			if (b.int_val==0){
				msg[0]="divided by zero";
			}else{
				c.type=c.NUM_DOUBLE;
				c.int_val=a.double_val/b.int_val;
			}
			return c;
		}else{ //NUM_DOUBLE
			Number c;
			c.type=c.NUM_DOUBLE;
			c.double_val=a.double_val/b.double_val;
			return c;
		}
	}
}
Number modNumber(Number a,Number b,const char ** msg){
	Number c;
	if (a.type!=a.NUM_INT || b.type!=b.NUM_INT){
		msg[0]="cannot use non-integer value in mod";
	}else{
		c.type=c.NUM_INT;
		c.int_val=a.int_val%b.int_val;
	}
	return c;
}
bool leNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			return a.int_val<b.int_val;
		}else{ //NUM_DOUBLE
			return a.int_val<b.double_val;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			return a.double_val<b.int_val;
		}else{ //NUM_DOUBLE
			return a.double_val<b.double_val;
		}
	}
}
bool geNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			return a.int_val>b.int_val;
		}else{ //NUM_DOUBLE
			return a.int_val>b.double_val;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			return a.double_val>b.int_val;
		}else{ //NUM_DOUBLE
			return a.double_val>b.double_val;
		}
	}
}
bool nleNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			return a.int_val>=b.int_val;
		}else{ //NUM_DOUBLE
			return a.int_val>=b.double_val;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			return a.double_val>=b.int_val;
		}else{ //NUM_DOUBLE
			return a.double_val>=b.double_val;
		}
	}
}
bool ngeNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			return a.int_val<=b.int_val;
		}else{ //NUM_DOUBLE
			return a.int_val<=b.double_val;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			return a.double_val<=b.int_val;
		}else{ //NUM_DOUBLE
			return a.double_val<=b.double_val;
		}
	}
}
bool eqNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			return a.int_val==b.int_val;
		}else{ //NUM_DOUBLE
			return a.int_val==b.double_val;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			return a.double_val==b.int_val;
		}else{ //NUM_DOUBLE
			return a.double_val==b.double_val;
		}
	}
}
bool neqNumber(Number a,Number b){
	if (a.type==a.NUM_INT){
		if (b.type==b.NUM_INT){
			return a.int_val!=b.int_val;
		}else{ //NUM_DOUBLE
			return a.int_val!=b.double_val;
		}
	}else{ //NUM_DOUBLE
		if (b.type==b.NUM_INT){
			return a.double_val!=b.int_val;
		}else{ //NUM_DOUBLE
			return a.double_val!=b.double_val;
		}
	}
}
