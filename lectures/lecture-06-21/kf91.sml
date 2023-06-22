fun f91(x) =
if x > 100 then x - 10 else f91(f91(x+11))

val f91_5 = f91(5)
val f91_21 = f91(21)
val f91_41 = f91(41)

fun kf91(x: int, k: int -> 'a) =
if x > 100 then k(x-10) else kf91(x+11, fn res => kf91(res, k))

val f91_45 = kf91(45, fn res => res)
