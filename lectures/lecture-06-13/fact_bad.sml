(*
HX-2023-06-13:
An example shows bad use of references.
*)
fun fact(x: int): int =
let
  val i0 = ref(0)
  val res = ref(1)
  fun loop(): unit =
    if !i0 < x then
      (i0 := !i0 + 1; res := !res * !i0; loop())
    else ()
in
  loop(); !res
end

val fact5 = fact(5)
val fact10 = fact(10)
