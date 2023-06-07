(* ****** ****** *)
use "./list_factorials.sml";
(* ****** ****** *)

local

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

fun
fact(x: int): int =
if x >= 1 then x * fact(x-1) else 1

(* ****** ****** *)

val N = 10
val () =
assert320
(list_factorials(N) =
 list_map(list_fromto(0, N), fact))

(* ****** ****** *)

val () =
print("midterm1-03-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-03-test.sml] *)
