(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

fun
stream_take
(fxs: 'a stream, n: int): 'a stream =
let
  fun helper(fxs, i) = fn () =>
    if i >= n then strcon_nil else
    case fxs() of
        strcon_nil => strcon_nil
      | strcon_cons(x1, fxs) => strcon_cons(x1, helper(fxs, i+1))
in
  helper(fxs, 0)
end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_take.sml] *)
