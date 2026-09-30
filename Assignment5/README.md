# Assignment 5
6.4
(i)
As x is not used in the functionbody of f, there is no type-constraint on it's type.


since α is not free in the outer environment, we generalize it, and we have to derive the polymorphic type ∀α. α -> int

This is why we derive f: ∀α. α -> int, as we cannot know what type argument x is.

(ii)
In the function body of f, x is constrained to int by x < 10 (p5), the 42 in the then branch (p1), therefore the else part of x+1 (p4), which leaves no type variables left to generalize and making f's type int -> int.


![pic](billede)


6.5 (1)

let f x = 1 in f f end:
the type is an int because for every value of f it will return 1.
let f g = g g in f end:
it is not typable. because we cant defer the type of either f or g we just no g is recursive.
let f x = let g y = y in g false end in f 42 end:
its a boolean. when x is 42 f x = g y = in which y would be false so it returns false which is a boolean.
let f x = let g y = if true then y else x in g false end in f 42 end:
it is not typable. because in this case the if else can return x which is an int or y which is a boolean.
let f x = let g y = if true then y else x in g false end in f true end:
it is a boolean. it will either return x which is true or y which is false. both are boolean. 

6.5 (2)
bool -> bool
inferType (fromString "let f x = if x then true else false in f end");;
val it: string = "(bool -> bool)"

int -> int
inferType (fromString "let f x = x + 1 in f end");;             
val it: string = "(int -> int)"

int -> int -> int
inferType (fromString "let f x = let f y = x + y + 1 in f end in f end");; 
val it: string = "(int -> (int -> int))"

’a -> ’b -> ’a
inferType (fromString "let f x = let g y = x   in g  end in f end");;
val it: string = "('h -> ('g -> 'h))"

’a -> ’b -> ’b
inferType (fromString "let f x = let g y = y   in g  end in f end");;    
val it: string = "('g -> ('h -> 'h))"

(’a -> ’b) -> (’b -> ’c) -> (’a -> ’c)
inferType (fromString "let compose f = let h g = let k x = g (f x) in k end in h end in compose end");;
val it: string = "(('l -> 'k) -> (('k -> 'm) -> ('l -> 'm)))"

’a -> ’b
inferType (fromString "let f g = let g = g in f g end in f end ");;       
val it: string = "('e -> 'f)"

’a
inferType (fromString "let f x = let g y = if true then g y else g y in g g end in f f end");;                                             
val it: string = "'n"



7.1
> fromFile "CEx/ex01.c";;
val it: Absyn.program =
Prog                                                                                
[Fundec                                                                             declaration
    (None, "main", [(TypI, "n")],                                                   function declaration + parameter
    Block                                                                           Statement
        [Stmt                                                                       
            (While                                                                  statement
            (Prim2 (">", Access (AccVar "n"), CstI 0),                              expression
                Block                                                               statement
                [Stmt (Expr (Prim1 ("printi", Access (AccVar "n"))));               expression statement
                Stmt                                                                
                    (Expr                                                           statement wrapper
                        (Assign                                                     expression
                        (AccVar "n",                                                expression
                            Prim2 ("-", Access (AccVar "n"), CstI 1))))]));         expression (access / lvalue)
        Stmt (Expr (Prim1 ("println", CstI 10)))])]                                 expression statement



> run (fromFile "CEx/ex01.c") [17];;
17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 
val it: Interp.store = map [(0, 0)]


> run (fromFile "CEx/ex05.c") [4];;
16 4 val it: Interp.store = map [(0, 4); (1, 4); (2, 16); (3, 4); (4, 2)]

> run (fromFile "CEx/ex11.c") [8];;
1 5 8 6 3 7 2 4 
1 6 8 3 7 4 2 5 
1 7 4 6 8 2 5 3 
1 7 5 8 2 4 6 3 
2 4 6 8 3 1 7 5 
2 5 7 1 3 8 6 4 
2 5 7 4 1 8 6 3 
2 6 1 7 4 8 3 5 
2 6 8 3 1 4 7 5 
2 7 3 6 8 5 1 4 
2 7 5 8 1 4 6 3 
2 8 6 1 3 5 7 4 
3 1 7 5 8 2 4 6 
3 5 2 8 1 7 4 6 
3 5 2 8 6 4 7 1 
3 5 7 1 4 2 8 6 
3 5 8 4 1 7 2 6 
3 6 2 5 8 1 7 4 
3 6 2 7 1 4 8 5 
3 6 2 7 5 1 8 4 
3 6 4 1 8 5 7 2 
3 6 4 2 8 5 7 1 
3 6 8 1 4 7 5 2 
3 6 8 1 5 7 2 4 
3 6 8 2 4 1 7 5 
3 7 2 8 5 1 4 6 
3 7 2 8 6 4 1 5 
3 8 4 7 1 6 2 5 
4 1 5 8 2 7 3 6 
4 1 5 8 6 3 7 2 
4 2 5 8 6 1 3 7 
4 2 7 3 6 8 1 5 
4 2 7 3 6 8 5 1 
4 2 7 5 1 8 6 3 
4 2 8 5 7 1 3 6 
4 2 8 6 1 3 5 7 
4 6 1 5 2 8 3 7 
4 6 8 2 7 1 3 5 
4 6 8 3 1 7 5 2 
4 7 1 8 5 2 6 3 
4 7 3 8 2 5 1 6 
4 7 5 2 6 1 3 8 
4 7 5 3 1 6 8 2 
4 8 1 3 6 2 7 5 
4 8 1 5 7 2 6 3 
4 8 5 3 1 7 2 6 
5 1 4 6 8 2 7 3 
5 1 8 4 2 7 3 6 
5 1 8 6 3 7 2 4 
5 2 4 6 8 3 1 7 
5 2 4 7 3 8 6 1 
5 2 6 1 7 4 8 3 
5 2 8 1 4 7 3 6 
5 3 1 6 8 2 4 7 
5 3 1 7 2 8 6 4 
5 3 8 4 7 1 6 2 
5 7 1 3 8 6 4 2 
5 7 1 4 2 8 6 3 
5 7 2 4 8 1 3 6 
5 7 2 6 3 1 4 8 
5 7 2 6 3 1 8 4 
5 7 4 1 3 8 6 2 
5 8 4 1 3 6 2 7 
5 8 4 1 7 2 6 3 
6 1 5 2 8 3 7 4 
6 2 7 1 3 5 8 4 
6 2 7 1 4 8 5 3 
6 3 1 7 5 8 2 4 
6 3 1 8 4 2 7 5 
6 3 1 8 5 2 4 7 
6 3 5 7 1 4 2 8 
6 3 5 8 1 4 2 7 
6 3 7 2 4 8 1 5 
6 3 7 2 8 5 1 4 
6 3 7 4 1 8 2 5 
6 4 1 5 8 2 7 3 
6 4 2 8 5 7 1 3 
6 4 7 1 3 5 2 8 
6 4 7 1 8 2 5 3 
6 8 2 4 1 7 5 3 
7 1 3 8 6 4 2 5 
7 2 4 1 8 5 3 6 
7 2 6 3 1 4 8 5 
7 3 1 6 8 5 2 4 
7 3 8 2 5 1 6 4 
7 4 2 5 8 1 3 6 
7 4 2 8 6 1 3 5 
7 5 3 1 6 8 2 4 
8 2 4 1 7 5 3 6 
8 2 5 3 1 7 4 6 
8 3 1 6 2 5 7 4 
8 4 1 3 6 2 7 5 
val it: Interp.store =
  map
    [(0, 8); (1, 0); (2, 9); (3, -999); (4, 0); (5, 0); (6, 0); (7, 0); (8, 0);
     ...]

prints out the solution to the 


7.2