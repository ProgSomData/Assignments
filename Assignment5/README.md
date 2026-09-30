# Assignment 5

6.5

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

(i)
As x is not used in the functionbody of f, there is no type-constraint on it's type.


since α is not free in the outer environment, we generalize it, and we have to derive the polymorphic type ∀α. α -> int

This is why we derive f: ∀α. α -> int, as we cannot know what type argument x is.

(ii)
In the function body of f, x is constrained to int by x < 10 (p5), the 42 in the then branch (p1), therefore the else part of x+1 (p4), which leaves no type variables left to generalize and making f's type int -> int.


![pic](billede)
