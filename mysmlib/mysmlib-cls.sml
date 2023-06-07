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
let
val _ =
list_forall
(xs, fn(x1) => (work(x1); true)) in ()
end

(* ****** ****** *)

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
( xs: 'apple list
, fopr: 'apple -> 'banana): 'banana list =
list_foldr(xs, [], fn(x, r) => fopr(x) :: r)

(* ****** ****** *)

fun
forall_to_foreach
( forall
: ('xs * ('x0 -> bool)) -> bool
)
: ('xs * ('x0 -> unit)) -> unit =
fn(xs, work) =>
(forall(xs, fn(x0) => (work(x0); true)); ())

fun
list_foreach(xs, work) =
forall_to_foreach(list_forall)(xs, work)

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

fun
list_forall(xs, test) =
foreach_to_forall(list_foreach)(xs, test)

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

val
list_foldleft =
fn(xs, r0, fopr) =>
foreach_to_foldleft(list_foreach)(xs,r0,fopr)
val
list_foldright =
fn(xs, r0, fopr) =>
foreach_to_foldleft(list_foreach)(xs,r0,fopr)

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

(* ****** ****** *)

fun
list_zip
(xs: 'a list, ys: 'b list): ('a * 'b) list =
(
case (xs, ys) of
  (nil, _) => nil
| (_, nil) => nil
| (x1 :: xs, y1 :: ys) => (x1, y1) :: list_zip(xs, ys)
)

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

(* end of [BUCASCS320-2023-Sum1-mysmlib-cls.sml] *)
