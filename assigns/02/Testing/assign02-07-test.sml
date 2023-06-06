(* ****** ****** *)
use "./../MySolution/assign02-07.sml";
(* ****** ****** *)

local

exception Error

in (* in-of-local *)

(* ****** ****** *)

fun
power
(x: int, y: int): int =
int1_foldleft(1, y, fn(r, _) => r * x)

(* ****** ****** *)

val
list_exists =
fn(xs, test) => forall_to_exists(list_forall)(xs, test)
val
list_forall' =
fn(xs, test) => forall_to_exists(list_exists)(xs, test)
val
list_exists' =
fn(xs, test) => forall_to_exists(list_forall')(xs, test)

(* ****** ****** *)

val xs = [1,2,3,4,5]
val p1 = fn(x) => (x < 6)
val p2 = fn(x) => (x > 2)
val p3 = fn(x) => (x = 2)
val p4 = fn(x) => (x = 6)
val ( ) =
assert320_some
(list_forall(xs, p1) = true, "assign02-07-test:01")
val ( ) =
assert320_some
(list_exists(xs, p2) = true, "assign02-07-test:02")
val ( ) =
assert320_some
(list_exists
 (xs, fn(x) => not(p1(x))) = false, "assign02-07-test:03")
val ( ) =
assert320_some
(list_forall
 (xs, fn(x) => not(p2(x))) = false, "assign02-07-test:04")
val ( ) =
assert320_some
(list_forall(xs, p1) = list_forall'(xs, p1), "assign02-07-test:1")
val ( ) =
assert320_some
(list_forall(xs, p2) = list_forall'(xs, p2), "assign02-07-test:2")
val ( ) =
assert320_some
(list_exists(xs, p1) = list_exists'(xs, p1), "assign02-07-test:3")
val ( ) =
assert320_some
(list_exists(xs, p2) = list_exists'(xs, p2), "assign02-07-test:4")
val ( ) =
assert320_some
(list_exists(xs, p3) = list_exists'(xs, p3), "assign02-07-test:5")
val ( ) =
assert320_some
(list_exists(xs, p4) = list_exists'(xs, p4), "assign02-07-test:6")

(* ****** ****** *)
val () = print("Assign02-07-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-07-test.sml] *)
