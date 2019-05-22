data Op = Add 
        | Mul
        deriving (Show)

data Ast = Lit Int 
        | Bin Op Ast Ast
        | Fun String Ast
        | App Ast Ast
        | Var String
        deriving (Show)

data Val = Num Int 
        | Closure String Ast Env
        deriving (Show)

type Env = [(String, Val)]

interp :: Ast -> Env -> Val
interp (Lit x) env = (Num x)
interp (Fun p b) env = Closure p b env
interp (Bin op x y) env = Num (opTrans op v w)
    where 
        Num v = interp x env
        Num w = interp y env
interp (App f x) env = interp fb ((fp, y): fe)
    where 
        Closure fp fb fe = interp f env
        y = interp x env
interp (Var x) env = (findVal x env)

opTrans :: Op -> (Int -> Int -> Int)
opTrans Add  = (+)
opTrans Mul = (*)

findVal :: String -> [(String, Val)] -> Val
findVal name env =
  case lookup name env of
    Just val  -> val
    Nothing -> error $ "Undefined variable used: " ++ name
