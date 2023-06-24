(* ****** ****** *)

use "./stream_evaluate.sml";

(* ****** ****** *)

(*
Assume:
a0 = 0, a1 = 1, a2 = -1/2, a3 = 1/3, a4 = -1/4, ...
Then we have ln2 = stream_evaluate(fxs, 1.0) // see Assign03
*)

(* ****** ****** *)

val int2real = Real.fromInt

(* ****** ****** *)

fun
afun
( n: int
, sgn: real): real stream = fn() =>
strcon_cons(sgn/int2real(n), afun(n+1, ~sgn))

(* ****** ****** *)

val
the_ln2_stream =
stream_evaluate
(stream_cons(0.0, afun(1, 1.0)), 1.0 (*x0*))

(* ****** ****** *)

val eps = 0.001
(* ****** ****** *)  
val fxs = the_ln2_stream
val strcon_cons(x1, fxs) = fxs()
(* ****** ****** *)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 1.0) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 0.5) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 0.833333) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 0.5833333) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 0.7833333) < eps)

(* ****** ****** *)

val () =
(
print
("the_ln2_stream(1000000) = ");
print
(
Real.toString
(
stream_get_at(the_ln2_stream, 1000000))^"\n"))

(* ****** ****** *)
val (  ) = print("stream_evaluate_test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-stream_evaluate_test.sml] *)
