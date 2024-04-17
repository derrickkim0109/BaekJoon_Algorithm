import sys

input = sys.stdin.readline

m, n = [int(input()) for _ in range(2)]

def is_prime(x):
    if x == 1:
        return False
    for i in range(2, int(x ** 0.5) + 1):
        if x % i == 0:
            return False
    return True

sum_value = sum([a for a in range(m, n + 1) if is_prime(a)])

if sum_value == 0:
    print(-1)
else:
    print(sum_value)

    for i in range(m, n + 1):
        if is_prime(i):
            print(i)
            break