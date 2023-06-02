(*
This is list subscripting
*)

fun
list_nth(xs: 'a list, n: int): 'a =
(
  case xs of
     nil => raise Subscript
   | x1 :: xs => if n <= 0 then x1 else list_nth(xs, n-1)
)
