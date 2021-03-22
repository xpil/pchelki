k = 2
for n in range(10, 1000000000):
    if ((n**k)//10)**(1/k) == int(((n**k)//10)**(1/k)) and ((n**k)//100)**(1/k) == int(((n**k)//100)**(1/k)):
        print(n, n**k)
