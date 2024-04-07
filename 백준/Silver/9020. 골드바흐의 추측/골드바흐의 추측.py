import sys

input = sys.stdin.readline

n = int(input())

def is_prime_numbers(x):
    is_prime = [True for _ in range(x + 1)]
    p = 2

    while p * p <= x:
        if is_prime[p] == True:
            for i in range(p * p, x + 1, p):
                is_prime[i] = False
        p += 1
    return [p for p in range(2, x + 1) if is_prime[p]]
        
for _ in range(n):
    num = int(input())
    primes = is_prime_numbers(num)

    start, end = 0, len(primes) - 1
    minValue = float('inf')
    result = []
    
    while start <= end:
        value = primes[start] + primes[end]
    
        if value == num:
            difference = abs(end - start)
            
            if minValue > difference:
                minValue = difference
                result = [primes[start], primes[end]]
            start += 1
            
        elif value < num:
            start += 1
        elif value > num:
            end -= 1
            
    print(*result)
