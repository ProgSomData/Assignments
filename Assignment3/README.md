# Assignment 3

Hjælpenoter til 3.5-7:
//load FSI med alle vigtige filer
dotnet fsi -r bin/Debug/net10.0/FsLexYacc.Runtime.dll Absyn.fs ExprPar.fs ExprLex.fs Parse.fs

//åben Parse.fs så vi kan køre fromString filen
open Parse;;


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