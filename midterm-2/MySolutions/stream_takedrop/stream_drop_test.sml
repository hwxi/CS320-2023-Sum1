(* ****** ****** *)

use "./stream_drop.sml";

(* ****** ****** *)

val fxs1 =
stream_tabulate(1000, fn n => n)
val fxs2 = stream_drop(fxs1, 200)

(* ****** ****** *)
val () = assert320(stream_length(fxs2) = 800)
(* ****** ****** *)
val (  ) = print("stream_drop_test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_drop_test.sml] *)
