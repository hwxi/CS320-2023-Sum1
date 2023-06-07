(* ****** ****** *)
use "./list_averages.sml";
(* ****** ****** *)

local

exception ERROR_midterm1_02

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val N = 1001
val xs = list_averages
(list_map
 (list_fromto(1, N), fn i => Real.fromInt(i)))

(* ****** ****** *)

val N = 1000001
val xs = list_averages
(list_map
 (list_fromto(1, N), fn i => Real.fromInt(i)))

(* ****** ****** *)

val () =
print("midterm1-01-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-01-test.sml] *)
