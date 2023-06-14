(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-14: 60 points
//
Please implement a function of the name quiz02_02
that takes two lists xs and ys of integers and checks
whether there exists a pair (x, y) such that |x-y| < 10
where x is in xs and y is in ys.
//
*)

(* ****** ****** *)

val
abs =
fn(x:int) =>
if x >= 0 then x else ~x

(* ****** ****** *)
(*
HX-2023-06-14:
You are not allowed to define recursive functions
to solve this problem. You can use any functions
in mysmlib.sml. If your defines recursive functions,
then it is DISQUALIFIED.
*)
(* ****** ****** *)

(*
val
quiz02_02 =
fn(xs: int list, ys: int list) => ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-quizzes-quiz02-02.sml] *)

