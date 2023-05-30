(* ****** ****** *)
(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is a class-wide library,
that is, it is shared by the class.
*)
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

(* end of [BUCASCS320-2023-Sum1-mysmlib-cls.sml] *)
