# Assignment 3

Exercise 3.5
Generated the lexer and parser for the expression language.

Exercise 3.6
See compString in Expr.fs

Exercise 3.7
Extended the expression language with conditional expressions If.
Added if to Absyn.fs.
Added tokens for if, then, else to the lexer.
Added If AST node to the parser.

Exercise 4.1
run (fromString "5+7");;
val it: int = 12

run (fromString "let y = 7 in y + 2 end");;
val it: int = 9

run (fromString "let f x = x + 7 in f 2 end");;
val it: int = 9

Exercise 4.2
run (fromString "let sum n = if n = 0 then n else n + sum (n-1) in sum 1000 end");;
val it: int = 500500

run (fromString "let eighth n = if n = 8 then 3 else 3 * eighth (n+1) in eighth 1 end");;
val it: int = 6561

run (fromString "let power x = if x = 0 then 1 else 3 * power(x-1) in let g y = if y = 0 then power y else power y + g(y-1) in g 11 end end");;
val it: int = 265720

run (fromString "let power x = let aux n = if n = 0 then 1 else x * aux (n-1) in aux 8 end in let count y = if y = 1 then power 1 else power y + count (y-1) in count 10 end end");;
val it: int = 167731333

Exercise 4.3
We extended the language to support a list of parameters and arguments instead of simply one.
This was done by changing Closure and Call to take in a string list instead of a string, and updating the evaluator to encompass all these variables at the same time.

Exercise 4.4
The parser was updated to support the changes made in Exercise 4.3.
We added new non-terminals to represent a list of arguments for function calls and param for letFun function definitions