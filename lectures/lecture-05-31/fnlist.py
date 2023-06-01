########################################################################
import sys
########################################################################
sys.setrecursionlimit(10000)
########################################################################
sys.path.append('./../../mypylib')
########################################################################
from mypylib_cls import * 
########################################################################
def fnlist_length(xs):
    res = 0
    while xs.ctag > 0:
        res += 1
        xs = xs.cons2
    return res
########################################################################
# fun
# list_fromto
# (start: int, finish: int): int list =
#   if start < finish
#   then start :: list_fromto(start+1, finish) else []
########################################################################
# def fnlist_fromto(start, finish):
#     if start < finish:
#         return fnlist_cons(start, fnlist_fromto(start+1, finish))
#     else:
#         return fnlist_nil()
########################################################################
def fnlist_fromto(start, finish):
    res = fnlist_nil()
    for i in range(finish-start):
        res = fnlist_cons(finish-i-1, res)
    return res
########################################################################
fnlist1000 = fnlist_fromto(0, 1000)
print("|fnlist1000| =", fnlist_length(fnlist1000))
fnlist1000000 = fnlist_fromto(0, 1000000)
print("|fnlist1000000| =", fnlist_length(fnlist1000000))
########################################################################
