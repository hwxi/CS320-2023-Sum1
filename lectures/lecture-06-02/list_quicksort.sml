exception Error
(*
Invented Tony Hoare
*)

fun
list_quicksort
(lte: 'a * 'a -> bool) (xs: 'a list): 'a list =
(
  case xs of
     nil => nil
   | x1 :: xs => list_partition lte (x1, xs, [], [])
)

and
list_partition
(lte: 'a * 'a -> bool)
(p0: 'a, xs: 'a list, ys: 'a list, zs: 'a list): 'a list =
(
  case xs of
    nil =>
    (list_quicksort lte ys) @
    (p0 :: (list_quicksort lte zs))
  | x1 :: xs =>
    if lte(x1, p0)
    then list_partition lte (p0, xs, x1 :: ys, zs)
    else list_partition lte (p0, xs, ys, x1 :: zs)
)

val xs =
[1,3,5,7,9,8,6,4,2,0]
val ys = list_quicksort (fn(x, y) => x <= y) (xs)
val zs = list_quicksort (fn(x, y) => x >= y) (xs)
val evenodds = list_quicksort (fn(x, y) => (x mod 2) <= (y mod 2)) (xs)
val oddevens = list_quicksort (fn(x, y) => (x mod 2) >= (y mod 2)) (xs)
