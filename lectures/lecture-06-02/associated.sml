exception NotFound
(*
[("a", 0), ("b", 1), ("c", 2), ....
*)
(*
  HX: this is a tail-recursive function
*)
fun
dbase_search
(dbase: (string * 'a) list, key: string): 'a =
case dbase of
  nil => raise NotFound
| kx1 :: dbase =>
  if key = #1(kx1) then #2(kx1) else dbase_search(dbase, key)

(* ****** ****** *)

val mydbase = [("a", 0), ("b", 1), ("c", 2) ]
val x0 = dbase_search(mydbase, "a")
val x1 = dbase_search(mydbase, "b")
val x2 = dbase_search(mydbase, "c")
val x3 = dbase_search(mydbase, "d") handle NotFound => ~1

(* ****** ****** *)

(* end of [associated.sml] *)
