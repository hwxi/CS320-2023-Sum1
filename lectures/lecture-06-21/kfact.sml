
fun fact(x) =
if x > 0 then x * fact(x-1) else 1

fun kfact(x, k) =
  if x > 0
  then kfact(x-1, fn res => k(x * res))
  else k(1)

val _ = kfact
(10, fn res => print("res = " ^ Int.toString(res) ^ "\n"))
val fact10 = kfact(10, fn res => res)
