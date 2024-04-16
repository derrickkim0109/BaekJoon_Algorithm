import sys

input = sys.stdin.readline

g = int(input())

# G = 성원의 현재 몸무게 제곱 - 성원이가 기억하는 몸무게의 제곱
# g = (x * x) - (y * y)
# 15 = x^2 - y^2

result = []

left, right = 1, 2

while True:
    if right ** 2 - (right - 1) ** 2 > 100_000:
        break 

    value = (right ** 2) - (left ** 2)
    
    if value < g:
        right += 1
        continue
    elif value > g: 
        left += 1
        continue
    elif value == g:
        result.append(right)
        right += 1
        continue

if result:
    for i in result:
        print(i)
else:
    print(-1)
    