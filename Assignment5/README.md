# Assignment 5

6.5
(i)
As x is not used in the functionbody of f, there is no type-constraint on it's type.


since α is not free in the outer environment, we generalize it, and we have to derive the polymorphic type ∀α. α -> int

This is why we derive f: ∀α. α -> int, as we cannot know what type argument x is.

(ii)
In the function body of f, x is constrained to int by x < 10 (p5), the 42 in the then branch (p1), therefore the else part of x+1 (p4), which leaves no type variables left to generalize and making f's type int -> int.


!(</Skærmbillede 2026-09-24 142508.png>)