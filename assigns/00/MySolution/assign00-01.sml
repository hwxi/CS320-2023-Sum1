(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

(*
fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
*)
val
rec
fact = fn(x: int) =>
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

fun
myloop(x: int): int =
(fact(x); myloop(x+1)) handle Overflow => x

(* ****** ****** *)

val myans = myloop(0)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-01.sml] *)
