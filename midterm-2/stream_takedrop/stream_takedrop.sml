(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

fun
stream_take(fxs, n) =
let
  fun helper(fxs, i) = fn () =>
    if i >= n then strcon_nil else
    case fxs() of
        strcon_nil => strcon_nil
      | strcon_cons(x1, fxs) => strcon_cons(x1, helper(fxs, i-1))
in
  helper(fxs, 0)
end

(* ****** ****** *)

fun
stream_take(fxs, n) =
let
  fun helper(fxs, i) = fn () =>
    if i >= n then strcon_nil else
    case fxs() of
        strcon_nil =>
	strcon_nil
      | strcon_cons(x1, fxs) =>
        strcon_cons(x1, helper(fxs, i+1))
in
  helper(fxs, 0)
end

(* ****** ****** *)

fun
stream_drop(fxs, n) =
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

(* end of [CS320-2023-Spring-stream_takedrop.sml] *)