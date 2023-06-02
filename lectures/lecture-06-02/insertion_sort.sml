
fun
insertion_sort(xs: int list): int list =
(
  case xs of
     nil => nil
   | x1 :: xs => insert_order(x1, insertion_sort(xs))
)

and insert_order(x1: int, xs: int list): int list =
(
    case xs of
	nil => [x1]
     |  x2 :: xs2 =>
	if x1 <= x2 then x1 :: xs else x2 :: insert_order(x1, xs2)
)

val xs =
  [1,3,5,7,9,8,6,4,2,0]
val ys = insertion_sort(xs)