import sys

input = sys.stdin.readline

n = int(input())

for i in range(1, n + 1):
    number = sum(map(int, str(i)))
    ns = i + number
    
    if ns == n:
        print(i)
        break
    if i == n:
        print(0)