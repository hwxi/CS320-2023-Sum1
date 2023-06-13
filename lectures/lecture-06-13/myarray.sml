
use "./../../mysmlib/mysmlib-cls.sml";

fun
array_foreach
(A: 'a array, work: 'a -> unit): unit =
int1_foreach
(Array.length(A), fn i => work(Array.sub(A, i)))

fun
array_iforeach
(A: 'a array, iwork: (int * 'a) -> unit): unit =
foreach_to_iforeach(array_foreach)(A, iwork)
