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
  | tree_cons(tl, _, tr) => 1 + int_max(tree_size(tl), tree_size(tr))
