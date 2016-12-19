UnHaskell
=============

UnHaskell is a LISP syntax Haskell-like [Unlambda](https://en.wikipedia.org/wiki/Unlambda) dialect. Started initially as a programming homework. Now development still in progress.
The language takes the idea from Unlambda:

* (Almost) everything is function. Functions are of type function -> function (and hence have no type at all).

However, important language sugars and modifications are made:


1. Lambda is introduced back, for the sake of any sane soul. A Lisp-style syntax is used. So I = ((S K) K).
2. Pure functional design, with referential transparency, lazy evaluation and CPS IO operation. There is no [strictness](https://wiki.haskell.org/Performance/Strictness) nor [delayed](http://www.madore.org/~david/programs/unlambda/#delay) application.
3. Module system, standard library and syntax sugar for CPS.

Getting Started
----------------

currently, only a basic repl-interpreter is implemented.
```
$ghc urepl.hs
$./urepl
; type :q to quit, :? for help
>(+ 3 1)
4
>(putChar 'a' (\_ (putChar '\n' exit)))
a
>:q
```

Language Specification
----------------

TODO