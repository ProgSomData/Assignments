(* Fun/Absyn.fs * Abstract syntax for micro-ML, a functional language *)

module Absyn

type expr = 
  | CstI of int
  | CstB of bool
  | Var of string
  | Let of string * expr * expr
  | Prim of string * expr * expr
  | If of expr * expr * expr
  //Exercise 4.3 extended to take in multiple variables in letfun
  | Letfun of string * string list * expr * expr    (* (f, xs, fBody, letBody) *)
  | Call of expr * expr list (* (f, xs) *)
  | Fun of string * expr       // Exercise 6.2: added Fun to AST
