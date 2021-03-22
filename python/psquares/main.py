k = 2
for n in range(10, 1000):
    if ((n**k)//10)**(1/k) == int(((n**k)//10)**(1/k)):
        print('!', n, n**k)
    if (int(str(n**k)[1:])**(1/k)) == int((int(str(n**k)[1:])**(1/k))):
        print('!!', n, n**k)
