(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

val strlen = (* length *)
foreach_to_length(string_foreach)
val strsub = (* subscripting *)
foreach_to_get_at(string_foreach)

(* ****** ****** *)

(*
HX-2023-06-14: 40 points
Please implement a function
[quiz02_01' of the following type:
//
fun
quiz02_01
(word: string): char -> int =
//
Given a word 'word' (of the type string),
'quiz02_01(word)' returns a function of the
type 'char -> int'; when applied to a char,
this function returns the number of times this
char appears in 'word'.

For instance, we have

quiz02_01("$abb^cccdddd")(#"0") = 0
quiz02_01("$abb^cccdddd")(#"1") = 0
quiz02_01("$abb^cccdddd")(#"a") = 1
quiz02_01("$abb^cccdddd")(#"b") = 2
quiz02_01("$abb^cccdddd")(#"c") = 3
quiz02_01("$abb^cccdddd")(#"d") = 4
quiz02_01("$abb^cccdddd")(#"z") = 0
quiz02_01("$abb^cccdddd")(#"$") = 1
quiz02_01("$abb^cccdddd")(#"^") = 1


*)

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
quiz02_01 =
fn(word: string) => ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-quizzes-quiz02-01.sml] *)
