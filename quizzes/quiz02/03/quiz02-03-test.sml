(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./quiz02-03.sml";
(* ****** ****** *)

(*
//
HX-2023-06-14: 100 points
//
Please implement a function of the name quiz02_03
that takes one list xs of integers and returns a sublist
consisting of every element in xs that is greater than all
the elements after it. For instance, if xs = [3,1,2,1,1],
then the sublist is [3,2,1]; if xs = [5,4,1,2,3], then the
sublist is [5,4,3].
//
*)

(* ****** ****** *)

local

exception ERROR_quiz02_03

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val xs = []
val () =
assert320(quiz02_03(xs) = [])

(* ****** ****** *)

val xs = [1,2,3,4,5]
val () =
assert320(quiz02_03(xs) = [5])

(* ****** ****** *)

val xs = [5,4,3,2,1]
val () =
assert320(quiz02_03(xs) = xs)

(* ****** ****** *)

val () = print
("quiz02-03-test: no failure is detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz02-03-test.sml] *)
