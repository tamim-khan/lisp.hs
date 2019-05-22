# lisp.hs

A lisp interpreter in Haskell

## Grammar for language

```
exp = (Lit number)
    | (Bin op exp exp)
    | (Fun id exp)
    | (App exp exp)
    | (Var id)

op = Add
   | Mul

id = String
```
