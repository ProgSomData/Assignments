# Assignment 9

## Exercise 11.1

### (i)
#### lenc xr (fun v -> cont (1 + v))
> lenc [2; 5; 7] id;;
val it: int = 3

> lenc [2; 5; 7] (printf "The answer is ’% d’ \n");;
The answer is ’ 3’ 
val it: unit = ()


### (ii)
#### lenc xs (fun v -> 2*v)
ents\AssignmentsRepo\Assignment9\Cont\Contfun.fs"\Programmer som data\Assignm
> lenc [2; 5; 7] (fun v -> printf "The answer is '%d'\n" (v * 2));;
val it: int = 6
val it: unit = ()

The result is 6, as we hardcoded (v+1) to the lambda at the end of the recursive call, and the cont argument is (v*2), which is then added when we reach the basecase. 


### (iii)
They are both tail-recursive solutions to the problem presented. First uses a continuation, the second uses an accumulator. Both solutions leave nothing behind in the current framecall, since all relevant calculations are passed on in the recursive call.

## 11.2

### (i)
> revc [2; 5; 7] (fun v -> v);;
val it: int list = [7; 5; 2]

### (ii)
> revc [2; 5; 7] (fun v -> v @ v);;
val it: int list = [7; 5; 2; 7; 5; 2]

instead of applying v -> v, we append v @ v, which means we append 2 to (v), which means we append 2 @ [7;5;2], then again with 5 @ [2;7;5;2] and again with 7 @ [5;2;7;5;2], since cont is applied to the entirety of (v @ [x]) in the lambda

### (iii)
See Contfun.fs
> revi [2; 5; 7] [];;
val it: int list = [7; 5; 2]

## 11.3
See contfun.fs for code
> prodc [2;5;7] id;;
val it: int = 70


## 11.4
> prodc [2; 0; 7] id;;
val it: int = 0

> prodc [2; 0; 7] (printf "The answer is ’% d’ \n");;
The answer is ’ 0’ 
val it: unit = ()

> prodc [2; 0; 7] (fun v -> printf "The answer is '%d'\n" (v * 2));;
The answer is '0'
val it: unit = ()


With id as argument, we can return 0 directly without affecting the result.

With printf, skipping the continuation also skips the printing operation.

If the continuation contains additional operations, an early computation stopapge will change its behaviour and what it returns.

see contfun.fs for prodi function


## 11.8
### (i)
ents\AssignmentsRepo\Assignment9\Cont\Icon.fs"ter\Programmer som data\Assignm
- run (Every(Write(
-     Prim("+", Prim("*", CstI 2, FromTo(1, 4)), CstI 1)
- )));;;;
3 5 7 9 val it: value = Int 0

### (ii)
ents\AssignmentsRepo\Assignment9\Cont\Icon.fs"ter\Programmer som data\Assignm
- run (Write(
-     Prim("<", CstI 50,
-         Prim("*", CstI 7, FromTo(1, 20)))
- ));;;;
56 val it: value = Int 56

### (iii + iv)
see icon.fs