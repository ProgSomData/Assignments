# Assignment 4
Exercise 4.5
Extended the language with the logical operators && and ||.
Added tokens for AND and OR to the lexer and parser, and translated them into If expressions.

Exercise 5.7
Extended typedFun.fs with list types via TypL of typ. 

Exercise 6.1
run (fromString "let add x = let f y = x+y in f end in add 2 5 end");;
val it: HigherFun.value = Int 7

run (fromString "let add x = let f y = x+y in f end in let addtwo = add 2 in addtwo 5 end end");;
val it: HigherFun.value = Int 7

run (fromString "let add x = let f y = x+y in f end in let addtwo = add 2 in let x = 77 in addtwo 5 end end end");;
val it: HigherFun.value = Int 7

run (fromString "let add x = let f y = x+y in f end in add 2 end");;
val it: HigherFun.value =
  Closure
    ("f", ["y"], Prim ("+", Var "x", Var "y"),
     [("x", Int 2);
      ("add",
       Closure
         ("add", ["x"],
          Letfun ("f", ["y"], Prim ("+", Var "x", Var "y"), Var "f"), []))])

The result of the third program is Int 7, as expected with static
(lexical) scoping. When addtwo is created, its closure captures x = 2.
The later binding x = 77 therefore does not affect addtwo.

The last program returns a closure instead of an integer because add 2
evaluates add with x = 2 and returns the inner function f. The closure
stores the body of f together with the environment containing x = 2.


Exercise 6.2
Extended the language with lambda functions by adding Fun of string * expr to Absyn.fs.
Updated HigherFun.fs so lambda functions evaluate to closures.

Exercise 6.3
Updated the lexer and parser to support the lambda functions.
Added FUN and ARROW tokens and a parser rule that creates a Fun expression.