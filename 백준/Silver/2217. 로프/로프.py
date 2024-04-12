import sys

input = sys.stdin.readline

n = int(input())

# n 개의 로프를 사용해 중량이 w인 물체를 들어올릴 때 w/n만큼 중량이 걸리게 된다.

k = [int(input()) for _ in range(n)]

k.sort()

answer = []

for lope in k:
    answer.append(lope * n)
    n -= 1

print(max(answer))