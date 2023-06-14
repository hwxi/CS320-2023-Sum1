
datatype 'a strmcon =
  strmcon_nil
| strmcon_cons of
  'a * (unit -> 'a strmcon)

type 'a stream = unit -> 'a strmcon

fun
from(n: int): int stream =
fn() => strmcon_cons(n, from(n+1))

val theNats = from(0)

(* ****** ****** *)

val fxs = theNats
val strmcon_cons(x0, fxs) = fxs()
val strmcon_cons(x1, fxs) = fxs()
val strmcon_cons(x2, fxs) = fxs()
val strmcon_cons(x3, fxs) = fxs()
val strmcon_cons(x4, fxs) = fxs()

(* ****** ****** *)

fun
stream_map
( fxs: 'a stream
, fopr: 'a -> 'b): 'b stream = fn() =>
case fxs() of
  strmcon_nil => strmcon_nil
| strmcon_cons(x1, fxs) =>
  strmcon_cons(fopr(x1), stream_map(fxs, fopr))

(* ****** ****** *)

fun
stream_filter
( fxs: 'a stream
, test: 'a -> bool): 'a stream = fn() =>
case fxs() of
  strmcon_nil => strmcon_nil
| strmcon_cons(x1, fxs) =>
  if
  not(test(x1))
  then
  stream_filter(fxs, test)()
  else
  strmcon_cons(x1, stream_filter(fxs, test))
  
(* ****** ****** *)

fun
sieve
(fxs: int stream): int stream = fn() =>
let
val strmcon_cons(p1, fxs) = fxs()
in
  strmcon_cons(p1, sieve(stream_filter(fxs, fn x1 => x1 mod p1 > 0)))
end

val thePrimes = sieve(from(2))

(* ****** ****** *)

val fxs = thePrimes
val strmcon_cons(p0, fxs) = fxs()
val strmcon_cons(p1, fxs) = fxs()
val strmcon_cons(p2, fxs) = fxs()
val strmcon_cons(p3, fxs) = fxs()
val strmcon_cons(p4, fxs) = fxs()

(* ****** ****** *)

fun
stream_append
( fxs: 'a stream
, fys: 'a stream): 'a stream = fn() =>
(
case fxs() of
  strmcon_nil => fys()
| strmcon_cons(x1, fxs) =>
  strmcon_cons(x1, stream_append(fxs, fys))
)

(* ****** ****** *)

fun
stream_alter
( fxs: 'a stream
, fys: 'a stream): 'a stream = fn() =>
(
case fxs() of
  strmcon_nil => fys()
| strmcon_cons(x1, fxs) =>
  strmcon_cons(x1, stream_alter(fys, fxs)))

(* ****** ****** *)

fun
stream_zip
( fxs: 'a stream
, fys: 'b stream): ('a * 'b) stream = fn() =>
(
case fxs() of
  strmcon_nil => strmcon_nil
| strmcon_cons(x1, fxs) =>
(
case fys() of
  strmcon_nil => strmcon_nil
| strmcon_cons(y1, fys) =>
  strmcon_cons((x1, y1), stream_zip(fxs, fys))
)
)

(* ****** ****** *)

fun
stream_z2map
( fxs: 'a stream
, fys: 'b stream
, fopr: ('a * 'b) -> 'c): 'c stream =
  stream_map(stream_zip(fxs, fys), fopr)

(* ****** ****** *)

fun
stream_tabulate
(n0: int, fopr: int -> 'a): 'a stream = let
fun
loop1(i0: int): 'a stream = fn() =>
 strmcon_cons(fopr(i0), loop1(i0+1))
fun
loop2(i0: int): 'a stream = fn() =>
 if i0 < n0
 then strmcon_cons(fopr(i0), loop2(i0+1))
 else strmcon_nil
in
  if n0 >= 0 then loop2(0) else loop1(0)
end

(* ****** ****** *)