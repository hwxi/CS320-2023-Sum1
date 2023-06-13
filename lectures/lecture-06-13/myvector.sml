
use "./../../mysmlib/mysmlib-cls.sml";

fun
vector_foreach
(A: 'a vector, work: 'a -> unit): unit =
int1_foreach
(Vector.length(A), fn i => work(Vector.sub(A, i)))

fun
vector_iforeach
(A: 'a vector, iwork: (int * 'a) -> unit): unit =
foreach_to_iforeach(vector_foreach)(A, iwork)
