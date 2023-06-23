(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a list xs and a natural number k0,
perm_counting_out(xs, k0) returns a permutation
of xs where the elements are listed according to
the order they are "counted out" in the following
process of counting:
//
Counting of the elements xs goes left to right
and the first count is 0. When the count reaches
k0, the element being counted is removed (that is,
the element is counted out) and counting starts again
with the following element. If counting reached the
last element remaining in the list, then the next element
to be counted is the first element in the list. Counting
stops when all the elements are counted out.
//
For instance,
perm_counting_out([1,2,3], 0) = [1,2,3]
perm_counting_out([1,2,3], 1) = [2,1,3]
perm_counting_out([1,2,3], 2) = [3,1,2]
perm_counting_out([1,2,3], 3) = [1,3,2]
perm_counting_out([1,2,3,4], 1) = [2,4,3,1]
perm_counting_out([1,2,3,4], 3) = [4,1,3,2]
//
*)

(* ****** ****** *)

fun
list_get_at(xs, n) =
foreach_to_get_at(list_foreach)(xs, n)

(* ****** ****** *)

fun
perm_counting_out
(xs: int list, k0: int): int list =
let

(*
val () = assert320(k0 > 0)
*)

fun
remove
( ys: int list
, zs: int list, i0: int): int list =
(
case ys of
  nil => nil
| y1 :: ys =>
  if i0 > 0
  then remove(ys, y1::zs, i0-1)
  else list_append(ys, list_reverse(zs))
)

fun
helper(xs, n0) =
if
n0 = 0
then [] else
let
  val i0 = k0 mod n0
in
  list_get_at(xs, i0) :: helper(remove(xs, [], i0), n0-1)
end
  
in
  helper(xs, length(xs))
end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-perm_counting_out.sml] *)
