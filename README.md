# Lispakell

Aimed at being an interpreter written in Haskell for a Lisp-like launguage that performs untyped lambda calculus as in [Unlambda](https://en.wikipedia.org/wiki/Unlambda).

Started initially as a programming homework. Now development still in progress.

The language features the following attributes:

1. Untyped lambda calculus, in which everything are of type function :: function -> function. True, False, lists and paris are all functions.
2. Purity, referential transparency, lazy evaluation and monadic IO operation, as in Haskell. And even purer than Haskell: you can do nothing [strict](https://wiki.haskell.org/Performance/Strictness).
3. Modules and imports
4. Builtin multi-precision integer and double precision floating point numbers
5. Standard library
