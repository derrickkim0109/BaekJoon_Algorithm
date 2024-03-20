import sys
from itertools import combinations

input = sys.stdin.readline
n, m = map(int, input().split())
graph = [list(map(int, input().split())) for _ in range(n)]

house = []
chicken = []

for i in range(n):
    for j in range(n):
        if graph[i][j] == 1:
            house.append((i, j))
        elif graph[i][j] == 2:
            chicken.append((i, j))

result = 2 * n * len(house)

for chickenComb in list(combinations(chicken, m)):
    distance = 0
    for hx, hy in house:
        temp = 2 * n 
        for cx, cy in chickenComb:
            temp = min(temp, abs(hx - cx) + abs(hy - cy))
        distance += temp
    result = min(result, distance)

print(result)