# Assignment 9

## Exercise 11.1

### (i)
ts\AssignmentsRepo\Assignment9\Cont\Contfun.fs"\Programmer som data\Assignm

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

let rec rev xs =
    match xs with
    | [] -> cont [] 
    | x::xr -> rev xr (fun v -> cont xr )