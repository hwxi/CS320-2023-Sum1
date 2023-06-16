(* ****** ****** *)
(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is a class-wide library,
that is, it is shared by the class.
*)
(* ****** ****** *)

val int_max = Int.max
val int_min = Int.min

(* ****** ****** *)

type 'a optn = 'a option

(* ****** ****** *)

exception
ERROR320 of string optn

(* ****** ****** *)

exception ConsMatch320
exception OptnSubscript320
exception ListSubscript320

(* ****** ****** *)

exception NotImplemented320

(* ****** ****** *)

type
('xs, 'x0) foreach_t =
'xs * ('x0 -> unit) -> unit
type
('xs, 'x0) iforeach_t =
'xs * (int * 'x0 -> unit) -> unit
type
('xs, 'x0, 'r0) ifoldleft_t =
'xs * 'r0 * ('r0 * int * 'x0 -> 'r0) -> 'r0

(* ****** ****** *)

fun
assert320
(claim: bool): unit =
if claim
  then () else raise ERROR320(NONE)
(* end of [assert320] *)

fun
assert320_some
(claim: bool, errmsg: string): unit =
if claim
  then () else raise ERROR320(SOME(errmsg))
(* end of [assert320_some] *)

(* ****** ****** *)

val abs_int =
fn(i0: int) =>
if i0 >= 0 then i0 else ~i0

(* ****** ****** *)

(*
fun
pow_int_int
(x: int, y: int): int =
if y <= 0
then 1 else x * pow_int_int(x, y-1)
*)
fun
pow_int_int
(x: int, y: int): int =
let
  fun loop(y: int, res: int): int =
    if y > 0
    then loop(y-1, x * res) else res
in
  loop(y, 1)
end

(* ****** ****** *)

fun
char_of_digit
(digit: int): char =
let
  val () =
  assert320_some
  (digit >= 0, "int2char")
  val () =
  assert320_some
  (digit <= 9, "int2char")
in
  chr(ord(#"0") + digit)
end (* end of [char_of_digit] *)

(* ****** ****** *)

fun
print_int
(x: int) = print(Int.toString(x))
fun
print_char
(c: char) = print( String.str(c) )

(* ****** ****** *)
fun
print_bool
(x: bool) = print(Bool.toString(x))
(* ****** ****** *)

fun
print_string(cs: string) = print(cs)

(* ****** ****** *)

fun
print_newline() = print("\n")
fun
println(cs) = (print(cs); print_newline())
fun
println_string(cs) = (print(cs); print_newline())

(* ****** ****** *)

fun
list_is_nil(xs: 'a list): bool =
(
case xs of nil => true | _ :: _ => false)
fun
list_is_cons(xs: 'a list): bool =
(
case xs of nil => false | _ :: _ => true)

(* ****** ****** *)

fun
list_unnil(xs: 'a list): unit =
(
case xs of nil => () | _ => raise ConsMatch320)
fun
list_uncons(xs: 'a list): 'a * 'a list =
(
case xs of
x1 :: xs => (x1, xs) | _ => raise ConsMatch320)

(* ****** ****** *)

fun
optn_is_none(xs: 'a optn): bool =
(
case xs of NONE => true | SOME _ => false)
fun
optn_is_some(xs: 'a optn): bool =
(
case xs of NONE => false | SOME _ => true)

(* ****** ****** *)

fun
optn_unnone(xs: 'a optn): unit =
(
case xs of NONE => () | _ => raise ConsMatch320)
fun
optn_unsome(xs: 'a optn): 'a =
(
case xs of SOME x0 => x0 | _ => raise ConsMatch320)

(* ****** ****** *)

(*
fun
list_length
(xs: 'a list): int =
(
case xs of
  nil => 0
| head :: tail => 1 + list_length(tail)
)
*)

fun
list_length
(xs: 'a list): int =
let
  fun
  loop
  (xs: 'a list, res: int): int =
  case xs of
    nil => res
  | _ :: xs => loop(xs, res+1)
in
  loop(xs, 0)
end (* end of [list_length(xs)]: let *)

(* ****** ****** *)

fun
list_extend
(xs: 'a list, x0: 'a): 'a list =
(
case xs of
  nil => [x0]
| x1 :: xs => x1 :: list_extend(xs, x0)
)

(* ****** ****** *)

fun
list_head(xs: 'a list): 'a =
case xs of
  nil => raise Empty | x1 :: _ => x1
fun
list_tail(xs: 'a list): 'a list =
case xs of
  nil => raise Empty | _ :: xs => xs

val hd = list_head (* hd is an alias *)
val tl = list_tail (* tl is an alias *)

(* ****** ****** *)

(*
datatype 'a optn = NONE | SOME of 'a
*)
fun
list_headopt(xs: 'a list): 'a optn =
case xs of
  nil => NONE | x1 :: _ => SOME(x1)
fun
list_tailopt(xs: 'a list): 'a list optn =
case xs of
  nil => NONE | _ :: xs => SOME(xs)

(* ****** ****** *)

(*
fun
list_last(xs: 'a list): 'a =
case xs of
  nil => raise Empty
| x1 :: xs =>
  (case xs of nil => x1 | _ => list_last(xs))
*)
fun
list_last(xs: 'a list): 'a =
let
  fun loop(x1, xs) =
  (case xs of
     nil => x1
   | x2 :: xs => loop(x2, xs))
in
  case xs of
    nil => raise Empty | x1 :: xs => loop(x1, xs)
end

(* ****** ****** *)

fun
list_append
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => x1 :: list_append(xs, ys)
)

val op@ = list_append
  
(* ****** ****** *)

fun
list_fromto
(start: int, finish: int): int list =
let
  fun
  loop
  (finish: int, res: int list): int list =
  if start < finish
  then loop(finish-1, (finish-1) :: res) else res
in
  loop(finish, [(*nil*)])
end

(* ****** ****** *)

(*
fun
list_reverse(xs: 'a list): 'a list =
(
case xs of
  nil => nil
| x1 :: xs => list_reverse(xs) @ [x1]
)
*)
fun
list_rappend
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => list_rappend(xs, x1 :: ys)
)

(* ****** ****** *)

fun
list_reverse
(xs: 'a list): 'a list = list_rappend(xs, [])

(* ****** ****** *)

(*
(*
This is an inefficient tail-recursive
implementation of list_append as it traverses
the first argument TWICE.
*)
fun
list_append
( xs: 'a list
, ys: 'a list): 'a list =
(
  case ys of
    nil => ys
  | _ => list_rappend(list_reverse(xs), ys) )
*)

(* ****** ****** *)

fun
list_forall
( xs: 'a list
, test: 'a -> bool): bool =
(
case xs of
  nil => true
| x1 :: xs =>
  test(x1) andalso list_forall(xs, test)
)

fun
list_exists
( xs: 'a list
, test: 'a -> bool): bool =
(
case xs of
  nil => false
| x1 :: xs =>
  test(x1) orelse list_exists(xs, test)
)

(* ****** ****** *)

fun
list_foreach
(xs: 'a list, work: 'a -> unit): unit =
(
case xs of
  nil => ()
| (x1::xs) => (work(x1); list_foreach(xs, work))
)

(* ****** ****** *)

(*
fun
list_forall
(xs: 'a list, test: 'a -> bool): bool =
let
exception False
in
(
list_foreach
(xs,
 fn(x1) =>
 if test(x1)
 then () else raise False); true)
handle False => false
end (* end-of-let: list_forall(xs, test) *)
*)

(* ****** ****** *)

(*
A Swiss army's knife for left-handed
*)
fun
list_foldl
( xs: 'a list
, r0: 'r, fopr: 'r * 'a -> 'r): 'r =
(
case xs of
  nil => r0
| x1 :: xs => list_foldl(xs, fopr(r0, x1), fopr)
)

(* ****** ****** *)

(*
A Swiss army's knife for right-handed
*)
(*
fun
list_foldr
( xs: 'a list
, r0: 'r, fopr: 'a * 'r -> 'r): 'r =
(
case xs of
  nil => r0
| x1 :: xs => fopr(x1, list_foldr(xs, r0, fopr))
)
*)
(*
HX:
This list_foldr implementation is tail-recursive!!!
*)
fun
list_foldr
( xs: 'a list
, r0: 'r, fopr: 'a * 'r -> 'r): 'r =
list_foldl
(list_reverse(xs), r0, fn(r, x) => fopr(x, r))

(* ****** ****** *)

fun
list_length
(xs: 'a list): int =
list_foldl(xs, 0, fn(r, x) => r + 1)

(* ****** ****** *)
(*
fun
list_extend
(xs: 'a list, x0: 'a): 'a list =
(
case xs of
  nil => [x0]
| x1 :: xs => x1 :: list_extend(xs, x0)
)
*)
fun
list_extend
(xs: 'a list, x0: 'a): 'a list =
list_append(xs, [x0])

fun
list_append
(xs: 'a list, ys: 'a list): 'a list =
list_foldr(xs, ys, fn(x, r) => x :: r)

fun
list_rappend
(xs: 'a list, ys: 'a list): 'a list =
list_foldl(xs, ys, fn(r, x) => x :: r)

(* ****** ****** *)

fun
list_map
( xs: 'a list
, fopr: 'a -> 'b): 'b list =
list_foldr(xs, [], fn(x, r) => fopr(x) :: r)

(* ****** ****** *)

fun
list_filter
(xs: 'a list, test: 'a -> bool): 'a list =
list_foldr
( xs, []
, fn(x1, res) => if test(x1) then x1 :: res else res)

(* ****** ****** *)

fun
forall_to_foreach
( forall
: ('xs * ('x0 -> bool)) -> bool
)
: ('xs * ('x0 -> unit)) -> unit =
fn(xs, work) =>
(forall(xs, fn(x0) => (work(x0); true)); ())

(* ****** ****** *)

fun
foreach_to_forall
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * ('x0 -> bool)) -> bool =
fn(xs: 'xs, test: 'x0 -> bool) =>
let
  exception False
in(*let*)
(* ****** ****** *)
let
val () =
foreach
(
xs
,
fn(x0: 'x0) =>
if
test(x0) then () else raise False)
in
  ( true )
end handle False(*void*) => (false)
(* ****** ****** *)
end (* end of [foreach_to_forall]: let *)

(* ****** ****** *)

fun
foreach_to_foldleft
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * 'r0 * ('r0*'x0 -> 'r0)) -> 'r0 =
fn(xs, r0, fopr) =>
let
val res = ref(r0)
in
foreach
( xs
, fn(x0) => res := fopr(!res, x0)); !res
end (* end of [foreach_to_foldleft]: let *)

(* ****** ****** *)

fun
foldleft_to_length
( foldleft
: ('xs * int * (int*'x0 -> int)) -> int)
: ('xs -> int) =
fn(xs: 'xs) => foldleft(xs, 0, fn(r0,x0) => r0+1)

(* ****** ****** *)

fun
foreach_to_length(foreach) =
foldleft_to_length(foreach_to_foldleft(foreach))

(* ****** ****** *)

fun
foreach_to_get_at
(
foreach:
('xs*('x0->unit))->unit): 'xs*int -> 'x0 =
fn(xs, i0) =>
let
exception Found of ('x0)
val foldleft = foreach_to_foldleft(foreach)
in (*let*)
(* ****** ****** *)
let
val r0 =
foldleft
( xs, 0
, fn(r0, x0) =>
  if i0 = r0 then
  raise Found(x0) else r0+1) in raise Subscript
end handle Found(x0) => x0
(* ****** ****** *)
end (* end-of-[foreach_to_get_at]: let *) 

(* ****** ****** *)

fun
foreach_to_listize
(
foreach:
('xs*('x0->unit))->unit): 'xs -> 'x0 list =
(
fn(xs) =>
list_reverse
(
foreach_to_foldleft
(foreach)(xs, nil, fn(r0, x0) => x0 :: r0)))

(* ****** ****** *)

fun
foreach_to_rlistize
(
foreach:
('xs*('x0->unit))->unit): 'xs -> 'x0 list =
fn(xs) =>
(foreach_to_foldleft
 (foreach)(xs, nil, fn(r0, x0) => x0 :: r0))

(* ****** ****** *)

fun
foreach_to_map_list
(
foreach:
('xs * ('x0->unit))->unit)
:
('xs * ('x0 -> 'y0)) -> 'y0 list
=
(
fn(xs, fopr) =>
list_reverse
(
foreach_to_foldleft
(foreach)(xs, nil, fn(r0, x0) => fopr(x0) :: r0)))

(* ****** ****** *)

fun
foreach_to_filter_list
(
foreach:
('xs * ('x0->unit))->unit)
:
('xs * ('x0 -> bool)) -> 'x0 list
=
(
fn(xs, test) =>
list_reverse
(
foreach_to_foldleft(foreach)
( xs, nil
, fn(r0, x0) => if test(x0) then x0 :: r0 else r0)))

(* ****** ****** *)

fun
int0_foreach
(n0: int, work: unit -> unit) =
let
fun
  loop(i0: int): unit =
  if i0 >= n0
  then ()
  else (work(); loop(i0+1)) in loop(0(*i0*))
end (* end of [int0_foreach(n0, work)]: let *)

(* ****** ****** *)
(*
HX: this is the same as the following Python loop:
for x in range(n0):
  work(x)
*)
fun
int1_foreach
(n0: int, work: int -> unit) =
let
fun
loop(i0: int): unit =
if i0 >= n0
then ()
else (work(i0); loop(i0+1)) in loop(0(*i0*))
end (* end of [int1_foreach(n0, work)]: let *)

(* ****** ****** *)

val int1_forall = fn(xs, test) =>
  foreach_to_forall(int1_foreach)(xs, test)

(* ****** ****** *)

val
int1_foldleft =
fn(xs,r0,fopr) =>
foreach_to_foldleft(int1_foreach)(xs,r0,fopr)
val
int1_foldright =
fn(xs,r0,fopr) =>
int1_foldleft(xs, r0, fn(r0, x0) => fopr(xs-1-x0, r0))

(* ****** ****** *)

fun
list_tabulate
( n0: int
, fopr: int -> 'a): 'a list =
list_reverse
(
int1_foldleft
(n0, [], fn(xs, i) => fopr(i) :: xs))

(* ****** ****** *)

fun
list_forall(xs, test) =
foreach_to_forall(list_foreach)(xs, test)

(* ****** ****** *)

val
list_foldleft =
fn(xs, r0, fopr) =>
foreach_to_foldleft(list_foreach)(xs,r0,fopr)
val
list_foldright =
fn(xs, r0, fopr) =>
list_foldleft
(list_reverse(xs), r0, fn(r, x) => fopr(x, r))

(* ****** ****** *)

fun
string_foreach
(xs: string, work: char -> unit): unit =
int1_foreach
(String.size(xs), fn(i) => work(String.sub(xs, i)))

(* ****** ****** *)

val
string_foldleft =
fn(xs, r0, fopr) =>
foreach_to_foldleft(string_foreach)(xs,r0,fopr)
val
string_foldright =
fn(xs, r0, fopr) =>
foreach_to_foldleft(string_foreach)(xs,r0,fopr)

(* ****** ****** *)

fun
list_labelize
(xs: 'a list): (int * 'a) list =
list_reverse
(#2
(
list_foldl
 (xs, (0, nil), fn((i, r), x) => (i+1, (i, x) :: r))
)
)
val list_enumerate = list_labelize

(* ****** ****** *)

fun
foreach_to_iforeach
( foreach
: ('xs, 'x0) foreach_t): ('xs, 'x0) iforeach_t =
fn(xs, iwork) =>
let
val _ =
foreach_to_foldleft(foreach)
(xs, 0, fn(p, x) => (iwork(p, x); p+1)) in () end

(* ****** ****** *)

fun
list_zip2
(xs: 'a list, ys: 'b list): ('a * 'b) list =
(
case (xs, ys) of
  (nil, _) => nil
| (_, nil) => nil
| (x1 :: xs, y1 :: ys) => (x1, y1) :: list_zip2(xs, ys)
)

(* ****** ****** *)

fun
list_z2foreach
( xs: 'a list
, ys: 'b list
, work: ('a * 'b) -> unit): unit =
(
case (xs, ys) of
  (nil, _) => ()
| (_, nil) => ()
| (x1 :: xs, y1 :: ys) =>
  (work(x1, y1); list_z2foreach(xs, ys, work))
)

(* ****** ****** *)

fun
list_z2map
( xs: 'a list
, ys: 'b list
, fopr: 'a * 'b -> 'c): 'c list =
list_map(list_zip2(xs, ys), fopr)
(*
case (xs, ys) of
  (nil, _) => nil
| (_, nil) => nil
| (x1 :: xs, y1 :: ys) => fopr(x1, y1) :: list_z2map(xs, ys, fopr)
*)

(* ****** ****** *)

fun
list_z2forall
( xs: 'a list
, ys: 'b list
, test: 'a * 'b -> bool): bool =
list_forall(list_zip2(xs, ys), test)

(* ****** ****** *)

fun
list_concat
(xss: 'a list list): 'a list =
list_foldr
(xss, [], fn(xs, res) => list_append(xs, res))
(*
case xss of
  nil => nil
| xs1 :: xss => list_append(xs1, list_concat(xss))
*)

(* ****** ****** *)

fun
list_cross2
(xs: 'a list, ys: 'b list): ('a * 'b) list =
list_concat
(list_map(xs, fn x => list_map(ys, fn y => (x, y))))

(* ****** ****** *)

fun
list_x2map
( xs: 'a list
, ys: 'b list
, fopr: 'a * 'b -> 'c): 'c list =
list_map(list_cross2(xs, ys), fopr)

(* ****** ****** *)

fun
list_x2forall
( xs: 'a list
, ys: 'b list
, test: 'a * 'b -> bool): bool =
list_forall(list_cross2(xs, ys), test)

(* ****** ****** *)

fun
list_x2exists
( xs: 'a list
, ys: 'b list
, test: 'a * 'b -> bool): bool =
list_exists(list_cross2(xs, ys), test)

(* ****** ****** *)

datatype 'a strcon =
  strcon_nil
| strcon_cons of
  ('a * (unit -> 'a strcon))

(* ****** ****** *)

type 'a stream = (unit -> 'a strcon)

(* ****** ****** *)

fun
strcon_head
(cxs: 'a strcon) =
case cxs of
strcon_nil => raise Empty
|
strcon_cons(cx1, fxs) => cx1

fun
strcon_tail
(cxs: 'a strcon) =
case cxs of
strcon_nil => raise Empty
|
strcon_cons(cx1, fxs) => fxs

(* ****** ****** *)

fun
stream_nil
((*void*)) =
  fn () => strcon_nil(*void*)
fun
stream_cons
( x1: 'a
, fxs
: 'a stream) =
   fn () => strcon_cons(x1, fxs)

(* ****** ****** *)

fun
stream_head
( fxs
: 'a stream) = strcon_head(fxs())
fun
stream_tail
( fxs
: 'a stream) = strcon_tail(fxs())

(* ****** ****** *)

fun
int1_streamize(n) = fn () =>
let
fun
helper(i): int strcon =
if
(i >= n)
then
strcon_nil(*void*)
else
strcon_cons
(i, fn () => helper(i+1)) in helper(0)
end

(* ****** ****** *)

fun
list_streamize(xs) = fn () =>
(
case xs of
  nil =>
  strcon_nil
| x1 :: xs =>
  strcon_cons(x1, list_streamize(xs))
)

(* ****** ****** *)

fun
stream_tabulate
( n0: int
, fopr: int -> 'a): 'a stream =
let
fun
fmain1
(i0: int): 'a stream = fn() =>
strcon_cons(fopr(i0), fmain1(i0+1))
fun
fmain2
(i0: int): 'a stream = fn() =>
if
i0 >= n0
then strcon_nil else
strcon_cons(fopr(i0), fmain2(i0+1))
in
if n0 < 0 then fmain1(0) else fmain2(0)
end (* end-of-[stream_tabulate(n0, fopr)] *)

(* ****** ****** *)

val
string_streamize =
fn(cs) =>
stream_tabulate
(String.size(cs), fn i => String.sub(cs, i))

(* ****** ****** *)

val
array_streamize =
fn(arr) =>
stream_tabulate
(Array.length(arr), fn i => Array.sub(arr, i))
val
vector_streamize =
fn(vec) =>
stream_tabulate
(Vector.length(vec), fn i => Vector.sub(vec, i))

(* ****** ****** *)

fun
stream_forall
(fxs, test) =
let
fun
auxmain(fxs): bool =
(
case fxs() of
  strcon_nil => true
| strcon_cons(x1, fxs) =>
  (test(x1) andalso auxmain(fxs))
)
in
  auxmain(fxs)
end (* end-of-[stream_forall(fxs, test)] *)

fun
stream_iforall
(fxs, itest) =
let
fun
auxmain(i0, fxs): bool =
(
case fxs() of
  strcon_nil => true
| strcon_cons(x1, fxs) =>
  (itest(i0, x1) andalso auxmain(i0+1, fxs))
)
in
  auxmain(0, fxs)
end (* end-of-[stream_iforall(fxs, itest)] *)

(* ****** ****** *)

fun
stream_foreach
(fxs, work) =
let
fun
auxmain(fxs): unit =
(
case fxs() of
  strcon_nil => ()
| strcon_cons(x1, fxs) =>
  (work(x1); auxmain(fxs))
)
in
  auxmain(fxs)
end (* end-of-[stream_foreach(fxs, work)] *)

(* ****** ****** *)

fun
stream_get_at
( fxs
: 'a stream, i0: int): 'a =
(
foreach_to_get_at(stream_foreach)(fxs, i0))

(* ****** ****** *)

fun
stream_iforeach
(fxs, iwork) =
let
fun
auxmain(i0, fxs): unit =
(
case fxs() of
  strcon_nil => ()
| strcon_cons(x1, fxs) =>
  (iwork(i0, x1); auxmain(i0+1, fxs))
)
in
  auxmain(0, fxs)
end (* end-of-[stream_iforeach(fxs, iwork)] *)

(* ****** ****** *)
val
stream_length = fn(fxs) =>
foreach_to_length(stream_foreach)(fxs)
(* ****** ****** *)

fun
stream_append
( fxs: 'a stream
, fys: 'a stream) = fn() =>
(
case fxs() of
strcon_nil => fys()
|
strcon_cons(x1, fxs) =>
strcon_cons(x1, stream_append(fxs, fys)))

(* ****** ****** *)

fun
stream_concat
( fxss: 'a stream stream) = fn() =>
(
case fxss() of
strcon_nil => strcon_nil
|
strcon_cons(fxs1, fxss) =>
stream_append(fxs1, stream_concat(fxss))())

(* ****** ****** *)

fun
stream_make_map(fxs, fopr) = fn () =>
(
case fxs() of
strcon_nil =>
strcon_nil
|
strcon_cons(x1, fxs) =>
strcon_cons
  (fopr(x1), stream_make_map(fxs, fopr))
)

(* ****** ****** *)

fun
stream_make_filter
( fxs: 'a stream
, test: 'a -> bool): 'a stream = fn () =>
(
case fxs() of
  strcon_nil =>
  strcon_nil
| strcon_cons(x1, fxs) =>
  if
  not(test(x1))
  then stream_make_filter(fxs, test)()
  else
  strcon_cons(x1, stream_make_filter(fxs, test))
)

(* ****** ****** *)

fun
stream_make_imap
( fxs: 'a stream
, ifopr
: int * 'a -> 'b) =
let
(* ****** ****** *)
fun
helper(fxs, i0: int) = fn() =>
case fxs() of
strcon_nil =>
strcon_nil(*void*)
|
strcon_cons(x1, fxs) =>
strcon_cons
( ifopr(i0, x1)
, helper(fxs, i0+1)) in helper(fxs, 0)
(* ****** ****** *)
end (* end-of-[stream_make_imap(fxs, ifopr)] *)

(* ****** ****** *)

fun
stream_make_ifilter
( fxs: 'a stream
, itest: int * 'a -> bool): 'a stream =
let
(* ****** ****** *)
fun
helper
(fxs, i0: int) = fn() =>
case fxs() of
strcon_nil => strcon_nil
|
strcon_cons(x1, fxs) =>
if
not(itest(i0, x1))
then helper(fxs, i0+1)()
else
strcon_cons
  (x1, helper(fxs, i0+1)) in helper(fxs, 0)
(* ****** ****** *)
end (* end-of-[stream_make_ifilter(fxs, ifopr)] *)

(* ****** ****** *)
(*
HX-2023-04-04:
For merging two ordered streams
*)
fun
stream_merge2
( fxs1: 'a stream
, fxs2: 'a stream
, lte3: 'a * 'a -> bool): 'a stream = fn() =>
(
case fxs1() of
  strcon_nil => fxs2()
| strcon_cons(x1, fxs1) =>
(
case fxs2() of
strcon_nil =>
strcon_cons(x1, fxs1)
|
strcon_cons(x2, fxs2) =>
if
lte3(x1, x2)
then strcon_cons
(x1, stream_merge2(fxs1, stream_cons(x2, fxs2), lte3))
else strcon_cons
(x2, stream_merge2(stream_cons(x1, fxs1), fxs2, lte3))
)
)
(* ****** ****** *)

(* end of [BUCASCS320-2023-Sum1-mysmlib-cls.sml] *)
