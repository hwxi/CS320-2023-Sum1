(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./quiz02-01.sml";
(* ****** ****** *)

local

exception ERROR_quiz02_01

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val () =
assert320
(quiz02_01("$abb^cccdddd")(#"0") = 0)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"1") = 0)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"a") = 1)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"b") = 2)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"c") = 3)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"d") = 4)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"X") = 0)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"Y") = 0)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"Z") = 0)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"$") = 1)
val () =
assert320
(quiz02_01("$abb^cccdddd")(#"^") = 1)

(* ****** ****** *)

val () = print
("quiz02-01-test: no failure is detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quizzes-quiz02-01-test.sml] *)
