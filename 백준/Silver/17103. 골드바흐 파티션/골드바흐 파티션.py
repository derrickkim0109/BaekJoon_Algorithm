import sys

input = sys.stdin.readline

t = int(input())
nums = [int(input()) for _ in range(t)]

def is_prime_numbers(x):
    is_prime = [True for _ in range(x + 1)]
    p = 2

    while p * p <= x:
        if is_prime[p] == True:
            for i in range(p * p, x+ 1, p):
                is_prime[i] = False
        p += 1

    return [p for p in range(2, x + 1) if is_prime[p]]


for num in nums:
    primes = is_prime_numbers(num)
    start, end = 0, len(primes) - 1
    count = 0 
    
    while start <= end:
        value = primes[start] + primes[end]

        if value == num:
            count += 1
            start += 1
        elif value < num:
            start += 1
        elif value > num:
            end -= 1
    print(count)