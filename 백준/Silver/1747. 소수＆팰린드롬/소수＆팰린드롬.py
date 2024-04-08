import sys

input = sys.stdin.readline

n = int(input())

def is_prime(x):
    if x == 1:
        return False
    for i in range(2, int(x ** 0.5) + 1):
        if x % i == 0:
            return False
    return True

result = 0

for i in range(n, 1_000_001):
    number = str(i)
    compared_num = number[::-1]
    if number == compared_num and is_prime(int(compared_num)):
        result = compared_num
        break

if result == 0:
    result = 1003001

print(result)