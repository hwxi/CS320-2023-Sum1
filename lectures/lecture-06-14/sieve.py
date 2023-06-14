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

def generator_filter(fxs, test):
  while True:
      x1 = next(fxs)
      if test(x1):
          yield x1

def generator_sieve(fxs):
    p1 = next(fxs)
    yield p1
    yield from generator_sieve(generator_filter(fxs, lambda x1: x1 % p1 > 0))

