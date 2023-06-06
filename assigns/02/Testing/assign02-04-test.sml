(* ****** ****** *)
use (* for class library *)
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./../MySolution/assign02-04.sml";
(* ****** ****** *)
val xs = []
val () =
assert320_some
(list_longest_ascend(xs) = xs, "assign02-04-test:1")
(* ****** ****** *)
val xs = [1, 2, 3, 4, 5]
val () =
assert320_some
(list_longest_ascend(xs) = xs, "assign02-04-test:2")
(* ****** ****** *)
val xs = [5, 4, 3, 2, 1]
val () =
assert320_some
(list_longest_ascend(xs) = [5], "assign02-04-test:3")
(* ****** ****** *)
val xs = [2, 1, 3, 3, 4, 4, 5]
val () =
assert320_some
(list_longest_ascend(xs) = [2, 3, 3, 4, 4, 5], "assign02-04-test:4")
(* ****** ****** *)
val xs = [2, 1, 1, 3, 3, 2, 4, 4, 5]
val () =
assert320_some
(list_longest_ascend(xs) = [1, 1, 3, 3, 4, 4, 5], "assign02-04-test:5")
(* ****** ****** *)
val xs = [2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5]
val () =
assert320_some
(list_longest_ascend(xs) = [2, 2, 3, 3, 4, 4, 5, 5], "assign02-04-test:6")
(* ****** ****** *)
val xs =
[4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1]
val () = 
assert320_some
(list_longest_ascend(xs) = [1, 1, 1, 1, 1, 1, 1, 1, 1], "assign02-04-test:7")
(* ****** ****** *)
val () = print("Assign02-04-test passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-04-test.sml] *)
