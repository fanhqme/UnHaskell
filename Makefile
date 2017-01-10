simpleruntime.ll: simpleruntime.c number.c intlist.c
	clang simpleruntime.c -o simpleruntime.ll -O2 -emit-llvm -S
	sed -i -e '/^target /d' simpleruntime.ll
