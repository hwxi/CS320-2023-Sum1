(* ****** ****** *)

use "./stream_take.sml";

(* ****** ****** *)

val fxs1 =
stream_tabulate(~1, fn n => n)
val fxs2 = stream_take(fxs1, 200)

(* ****** ****** *)

val () = assert320(stream_length(fxs2) = 200)

(* ****** ****** *)
val (  ) = print("stream_take_test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_take_test.sml] *)
