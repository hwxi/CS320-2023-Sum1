(*
insertion_sort is O(n^2) where n is the length of
the list being sorted.
*)
fun
insertion_sort
    (lte: ('a * 'a) -> bool) (xs: 'a list): 'a list =
(
  case xs of
     nil => nil
   | x1 :: xs => insert_order lte (x1, insertion_sort lte (xs))
)

and insert_order
    (lte: 'a * 'a -> bool) (x1: 'a, xs: 'a list): 'a list =
(
    case xs of
	nil => [x1]
     |  x2 :: xs2 =>
	if lte(x1, x2) then x1 :: xs else x2 :: insert_order lte (x1, xs2)
)

val xs =
  [1,3,5,7,9,8,6,4,2,0]
val ys = insertion_sort (fn(x, y) => x <= y) (xs)
val zs = insertion_sort (fn(x, y) => x >= y) (xs)
val evenodds = insertion_sort (fn(x, y) => (x mod 2) <= (y mod 2)) (xs)
val oddevens = insertion_sort (fn(x, y) => (x mod 2) >= (y mod 2)) (xs)
