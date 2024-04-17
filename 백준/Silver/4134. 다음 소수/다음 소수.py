import sys, math
input = sys.stdin.readline

def prime(x):
    if x == 0 or x == 1:
        return False
    for i in range(2, int(math.sqrt(n))+1):
        if x % i == 0:
            return False
    return True


T = int(input())
for _ in range(T):
    n = int(input())
    
    while True:
        if prime(n):
            print(n)
            break
        else:
            n += 1
