(* ****** ****** *)
use
"./../../MySolution/SML/assign04-01.sml";
(* ****** ****** *)

fun
perm_capture_231
(xs: int list): bool =
let

fun
helper1(xs) =
(
case xs of
nil => false
|
x1 :: xs =>
helper2(x1, xs) orelse helper1(xs))

and
helper2(x1, xs) =
(
case xs of
nil => false
|
x2 :: xs =>
(
(x1 < x2)
andalso
helper23(x1, x2, xs)) orelse helper2(x1, xs))

and
helper23(x1, x2, xs) =
(
case xs of
nil => false
|
x3 :: xs =>
(x1 > x3) orelse helper23(x1, x2, xs))

in
  helper1(xs)
end (* end-of-let: [perm_capture_231( xs) ] *)


(* ****** ****** *)

local

exception Error

in (* in-of-local *)

(* ****** ****** *)
(*
val
stream_length = fn fxss =>
foreach_to_length(stream_foreach)(fxss)
*)
(* ****** ****** *)

val () =
assert320
(
stream_length
(stream_permute_list[1,2,3,4,5]) = 5*4*3*2*1)

(* ****** ****** *)

val () =
assert320
(
stream_length
( stream_make_filter
  ( stream_permute_list[1,2,3,4,5]
  , fn xs => not(perm_capture_231(xs)))) = 42
)

(* ****** ****** *)

val () =
assert320
(
length
(
stream_get_at
(stream_permute_list
 (list_tabulate(20, fn _ => 0)), 1000000)) = 20)

(* ****** ****** *)
val () = print( "Assign04-01-test passed!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-01-test.sml] *)
