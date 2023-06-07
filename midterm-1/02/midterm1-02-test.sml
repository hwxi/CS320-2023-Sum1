(* ****** ****** *)
use "./list_pairing.sml";
(* ****** ****** *)

fun
int1_map_list(n, f) =
list_map(list_fromto(0, n), f)

(* ****** ****** *)

local

exception ERROR_midterm1_02

(* ****** ****** *)

in (*local*)

(* ****** ****** *)

val N = 1000
val xs =
list_pairing(int1_map_list(N, fn i => i))

(* ****** ****** *)

val N = 1000001
val xs =
list_pairing(int1_map_list(N, fn i => i))

(* ****** ****** *)

val () =
print("midterm1-02-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-02-test.sml] *)
