(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./quiz02-02.sml";
(* ****** ****** *)

(*
//
HX-2023-02-20: 60 points
//
Please implement a function of the name quiz02_02
that takes two lists xs and ys of integers and checks
whether there exists a pair (x, y) such that |x-y| < 10
where x is in xs and y is in ys.
//
*)

(* ****** ****** *)

local

exception ERROR_quiz02_02

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val xs = []
val ys = [1,2,3]
val () =
assert320
(quiz02_02(xs, ys) = false)

(* ****** ****** *)

val xs = [1,2,3,4,5]
val ys = [15,20,30,40,50]
val () =
assert320
(quiz02_02(xs, ys) = false)

(* ****** ****** *)

val xs = [1,2,3,4,5]
val ys = [15,20,30,40,~8]
val () =
assert320(quiz02_02(xs, ys) = true)

(* ****** ****** *)

val () = print
("quiz02-02-test: no failure is detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz02-02-test.sml] *)

