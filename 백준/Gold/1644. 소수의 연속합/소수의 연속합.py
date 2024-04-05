import sys

input = sys.stdin.readline

n = int(input())

# 소수가 없는 경우(1)를 먼저 처리
if n == 1:
    print(0)
    exit(0)

def is_prime_number(x):
    is_prime = [True for _ in range(x + 1)]
    for p in range(2, int(x**0.5) + 1):
        if is_prime[p]:
            for i in range(p*p, x+1, p):
                is_prime[i] = False
    return [p for p in range(2, x+1) if is_prime[p]]
        
prime_nums = is_prime_number(n)

if not prime_nums: # 소수 리스트가 비어있는 경우 처리
    print(0)
    exit(0)

start, end = 0, 0
temp_sum = prime_nums[start] if prime_nums else 0 # prime_nums가 비어 있지 않다고 가정할 때 안전한 접근
count = 0

while start <= end:
    if temp_sum > n:
        temp_sum -= prime_nums[start]
        start += 1
    else: 
        if temp_sum == n:
            count += 1
        if end < len(prime_nums) - 1:
            end += 1
            temp_sum += prime_nums[end]
        else:
            break

print(count)
