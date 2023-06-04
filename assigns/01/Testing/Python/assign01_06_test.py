####################################################
import sys
sys.path.append('./../../MySolution/Python')
from assign01_05 import *
from assign01_06 import *
####################################################
print("[import ./../../MySolution/Python/assign01_06.py] is done!")
####################################################
xs = mylist_nil()
xs = mylist_cons(2, xs)
xs = mylist_cons(4, xs)
xs = mylist_cons(3, xs)
xs = mylist_cons(1, xs)
xs = mylist_cons(3, xs)
xs = mylist_cons(4, xs)
xs = mylist_cons(2, xs)
xs = mylist_cons(1, xs)
xs = mylist_append(xs, xs)
xs = mylist_append(xs, xs)
####################################################
print("xs = ",end=''); mylist_print(xs); print();
####################################################
def mylist_sortedq(xs):
    def helper(xs, x0):
        if (xs.ctag==0):
            return True
        else:
            x1 = xs.cons1
            xs = xs.cons2
            return (x0 <= x1 and helper(xs, x1))
        # end-of-[if-then-else]
    if (xs.ctag==0):
        return True
    else:
        return helper(xs.cons2, xs.cons1)
    # end-of-[if-then-else]
# end-of-[def mylist_sortedq(xs)]
####################################################
ys = mylist_quicksort(xs)
assert(mylist_sortedq(ys))
print("ys = ",end=''); mylist_print(ys); print();
####################################################
print("Assign01-06-test passed!\n")
####################################################
#
# end-of-[assign01_06_test.py]
#
####################################################
