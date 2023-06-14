
datatype 'a strmcon =
  strmcon_nil
| strmcon_cons of
  'a * (unit -> 'a strmcon)

type 'a stream = unit -> 'a strmcon

fun
from(n: int): int stream =
fn() => strmcon_cons(n, from(n+1))

val theNats = from(0)

val fxs = theNats
val strmcon_cons(x0, fxs) = fxs()
val strmcon_cons(x1, fxs) = fxs()
val strmcon_cons(x2, fxs) = fxs()
val strmcon_cons(x3, fxs) = fxs()
val strmcon_cons(x4, fxs) = fxs()