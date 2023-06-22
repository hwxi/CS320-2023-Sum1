(*
'fun' is a form of "syntactic sugar"
*)
fun
isevn(x: int): bool = if x > 0 then isodd(x-1) else true
and
isodd(x: int): bool = if x > 0 then isevn(x-1) else false

val
rec
isevn =
fn x => if x > 0 then isodd(x-1) else true
and
isodd =
fn x => if x > 0 then isevn(x-1) else false
						      
fun
kisevn(x: int, k: bool -> 'a): 'a =
if x > 0 then kisodd(x-1, k) else k(true)
