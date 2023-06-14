def generator_tabulate(n0, fopr):
    if n0 >= 0:
        i0 = 0
        while i0 < n0:
            yield fopr(i0)
            i0 = i0 + 1
    else:
        i0 = 0
        while True:
            yield fopr(i0)
            i0 = i0 + 1
    return None # this line is deadcode

def generator_append(fxs, fys):
    yield from fxs
    yield from fys

