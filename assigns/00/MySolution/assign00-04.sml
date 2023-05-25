(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

fun
str2int
(cs: string): int =
let
  fun helper(i0: int): int =
    if i0 <= 0 then 0 else
    10 * helper(i0 - 1) + 
    Char.ord(String.sub(cs, i0-1)) - Char.ord(#"0")
in
  helper(String.size(cs))
end

val myans1 = str2int("12345")
val myans2 = str2int("98765")

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-04.sml] *)
