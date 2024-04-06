import sys

input = sys.stdin.readline

m, n = list(map(int, input().split()))

def is_prime_numbers(m, n):
    if m == 1: # 1은 소수가 아니므로 제외
        m = 2
         
    is_prime = [True for _ in range(n + 1)]

    p = 2 
    while p * p <= n:
        if is_prime[p] == True:
            for i in range(p * p, n + 1, p):
                is_prime[i] = False
        p += 1

    return [p for p in range(m, n + 1) if is_prime[p]]

answer = is_prime_numbers(m, n)

for i in answer:
    print(i)