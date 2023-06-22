fun fibo(x) =
if x < 2 then x else fibo(x-2) + fibo(x-1)

fun
kfibo(x: int, k: int -> 'a) =
if x < 2 then k(x) else
kfibo(x-2, fn res1 => kfibo(x-1, fn res2 => k(res1 + res2)))
