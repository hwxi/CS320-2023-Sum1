use "./../../mysmlib/mysmlib-cls.sml";

datatype 'a tree =
  tree_nil (* empty *)
| tree_cons of 'a tree * 'a * 'a tree

(*
fun
tree_size tree_nil = 0
|
tree_size
(tree_cons(tl, _, tr)) = tree_size(tl) + 1 + tree_size(tr)
*)

fun tree_size (xs: 'a tree): int =
  case xs of
    tree_nil => 0
  | tree_cons(tl, _, tr) => tree_size(tl) + 1 + tree_size(tr)

fun tree_height (xs: 'a tree): int =
  case xs of
    tree_nil => 0
  | tree_cons(tl, _, tr) => 1 + int_max(tree_height(tl), tree_height(tr))

val xs = tree_nil
val xs = tree_cons(xs, 1, xs) (* This is a LEAF! *)
val xs = tree_cons(xs, 2, xs)
val xs = tree_cons(xs, 3, xs)
val xs3 = xs
val xs = tree_cons(xs, 4, xs)
val xs4 = xs
val xs = tree_cons(xs, 5, xs)
val xs = tree_cons(xs, 6, xs)
val xs = tree_cons(xs, 7, xs)
val xs = tree_cons(xs, 8, xs)
val xs = tree_cons(xs, 9, xs)
val size_of_xs = tree_size(xs)
val height_of_xs = tree_height(xs) (* size = 2^height - 1 *)

fun tree_flatten(xs: 'a tree): 'a list =
  case xs of
    tree_nil => []
  | tree_cons(xs1, x0, xs2) => tree_flatten(xs1) @ (x0 :: tree_flatten(xs2))

val xs31 = tree_cons(tree_nil, 10, xs3)
val xs31_flatten = tree_flatten(xs31)

fun tree_reverse(xs: 'a tree): 'a tree =
  case xs of
    tree_nil => tree_nil
  | tree_cons(xs1, x0, xs2) => tree_cons(tree_reverse xs2, x0, tree_reverse xs1)

val xs31_reverse = tree_reverse(xs31)

val xs31_reverse_flatten = tree_flatten(xs31_reverse)
