(* ****** ****** *)

fun
string_foldl
( xs: string
, r0: 'r, fopr: 'r * char -> 'r): 'r =
let
val ln = String.size(xs)
fun
loop(i0: int, r0: 'r): 'r =
  if i0 < ln then
  loop(i0+1, fopr(r0, String.sub(xs, i0))) else r0
in
  loop(0, r0)
end

(* ****** ****** *)

fun
string_length(xs) =
string_foldl(xs, 0, fn(r, x) => r + 1)

(* ****** ****** *)
