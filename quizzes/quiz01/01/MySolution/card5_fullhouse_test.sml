(* ****** ****** *)

use "./card5_fullhouse.sml";

(* ****** ****** *)

exception Error320 of string

(* ****** ****** *)

fun
assert320
(claim: bool) =
if claim
then () else raise Error320("card5_fullhouse")

(* ****** ****** *)

val
hand01 = (S1::H2::D3::D4::D5::[])
val
hand02 = (H9::D9::SJ::DJ::CJ::[])
val
hand03 = (S9::H9::D9::CJ::SJ::[])
val
hand04 = (D5::C5::SJ::HQ::DK::[])
val
hand05 = (C5::SQ::HQ::DQ::DK::[])

(* ****** ****** *)

val () = assert320(not(card5_fullhouse(hand01)))
val () = assert320(   (card5_fullhouse(hand02)))
val () = assert320(   (card5_fullhouse(hand03)))
val () = assert320(not(card5_fullhouse(hand04)))
val () = assert320(not(card5_fullhouse(hand05)))

(* ****** ****** *)

val () = print("Testing for card5_fullhouse passed!\n")

(* ****** ****** *)

(* end of [CS320-2023-Sum1-quiz01-card5_fullhouse_test.sml] *)
