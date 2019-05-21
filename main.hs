
data Op = Plus | Times
opTrans Plus = (+)
opTrans Times = (*)

data Ast = Number Integer
        | Bin Op Ast Ast
        | Fun String Ast
        | App Ast Ast
        | Var String

data val = Numb Integer | Closure String Ast Env
