(* ****** ****** *)
use (* for class library *)
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
use "./../MySolution/assign02-02.sml";
(* ****** ****** *)
val () =
assert320_some
(list_range(1, 1) = [], "assign02-02-test:1")
val () =
assert320_some
(list_range(2, 1) = [], "assign02-02-test:2")
val () =
assert320_some
(list_range(1, 5) = [1,2,3,4], "assign02-02-test:3")
(* ****** ****** *)
val () =
assert320_some
(list_range(~4, 0) = [~4,~3,~2,~1], "assign02-02-test:4")
(* ****** ****** *)
val () = print("Assign02-02-test passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-02-test.sml] *)
