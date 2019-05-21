# lisp.hs

A lisp interpreter in Haskell

## Grammar for language

```scheme
exp = number
    | (op exp exp)
    | (fun (id) exp)
    | (with ((id exp)) exp)
    | (exp exp)
    | id
op = + | *
```
