(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

fun
stream_drop
(fxs: 'a stream, n: int): 'a stream =
let
  fun helper(fxs, i) =
    if i >= n then fxs else
    case fxs() of
        strcon_nil => stream_nil()
      | strcon_cons(x1, fxs) => helper(fxs, i+1)
in
  fn () => helper(fxs, 0)()
end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_drop.sml] *)
