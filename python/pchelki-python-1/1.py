n, step = (17, 0)
while n!=1:
    if n % 2 == 0: n /= 2
    else: n = n * 3 + 1
    step += 1
    print( "step = %d, n = %d" % (step, n), end = "; " if step % 5 != 0 else "\n")