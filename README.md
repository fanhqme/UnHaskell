U.hs
=============

U.hs is a weakly typed pure functional lazy evaluating toy language based on untyped lambda calculus. It features a very simply type system (which borrows from [Unlambda](https://en.wikipedia.org/wiki/Unlambda)):
```
function :: function -> function
```
Hence, there is essentially no type at all, so any program type-checks. However, important modifications are made to make the language marginally useful:

1. Lambda is introduced back, for the sake of any sane soul. A Lisp-style syntax is used for function application.
2. Built-in callback-based IO mechanism to let the program say hello world. Also, there are built-in numeric values.
3. Module system, standard library and syntax sugar.

The purpose of U.hs is to let those annoyed by Haskell's type system get a look and feel of how life is like without it. You can use the power of untyped lambda calculus to (re-)invent:

* Pairs, bools, lists and various fundamental data types
* Pattern matching, guard statement
* Monadic programming

And along the way, you will begin to appreciate how good the world was.

Getting Started
----------------

U.hs uses file extension .u. Example of aplusb.u:
```
(import* io)
(import* str)
(run
	(line readLine)
	(let s (sum (map atoi (splitStr ' ' (rstrip line)))))
	(_ (putStrLn (itoa s)))
	(exit 0)
)
```
The "run" statement is syntax sugar for chaining callbacks: (run (a b) (c d) e) = (b (\\a (d (\\c e)))). 

To interpretively run the program call urun
```
$ghc urun.hs
$./urun aplusb.u
1 2
3
```

urun is also an REPL interpreter
```
$./urun
; type :q to quit, :? for help
prelude>(+ 3 1)
4
prelude>(import* io)
prelude io>(putStrLn "ha" print)
ha
0
>:q
```
Note that, "print" is just the identity function (\\x x).

There is also a way to compile .u source code to binary:
```
$ghc ucomp.hs
$./ucomp aplusb.u
$./aplusb
1 2
3 
```

Language Specification
----------------
There is a (Chinese) tutorial called "report.pdf" in report/report.pdf.

More documentation will be written when the language reaches a relatively stable state.