(* ****** ****** *)
use "./fibonacci_nonrec.sml";
(* ****** ****** *)

local

(* ****** ****** *)

in (*local*)

(* ****** ****** *)
fun
fibonacci(x: int): int =
if x >= 2
then fibonacci(x-2)+fibonacci(x-1) else x
(* ****** ****** *)

val N = 10
val () =
assert320
(int1_forall
 (N, fn i => fibonacci_nonrec(i) = fibonacci(i)))

(* ****** ****** *)

val () =
print("midterm1-04-test: no failure detected!\n")

(* ****** ****** *)

end(*end-of-local*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-04-test.sml] *)
