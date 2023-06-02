datatype 'a ylist =
  ylist_nil
| ylist_cons of 'a * 'a ylist
| ylist_snoc of 'a ylist * 'a

fun ylist_length(ys: 'a ylist): int =
  case ys of
    ylist_nil => 0
  | ylist_cons(_, ys) => 1 + ylist_length(ys)
  | ylist_snoc(ys, _) => ylist_length(ys) + 1

(*
fun ylist_last(ys: 'a ylist): 'a =
  case ys of
    ylist_nil => raise Empty
  | ylist_snoc(ys, y1) => y1
  | ylist_cons(y1, ys) => ???
*)
