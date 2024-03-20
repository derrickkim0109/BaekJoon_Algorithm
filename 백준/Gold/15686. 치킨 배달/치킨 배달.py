import sys
from collections import deque

input = sys.stdin.readline
n, m = map(int, input().split())
graph = [list(map(int, input().split())) for _ in range(n)]

chicken = deque([])
house = deque([])
select = deque([])

for x in range(n):
    for y in range(n):
        if graph[x][y] == 1:
            house.append((x, y))
        elif graph[x][y] == 2:
            chicken.append((x, y))

# 총 치킨집 수
k = len(chicken) 

# 총 치킨 거리 임의의 큰 값
result = 2 * n * len(house)

# count: 고른 치킨집 수 
# idx: 고른 치킨집 인덱스
def dfs(count, idx):
    global result
    
    total = 0

    # 모든 치킨집을 골랐다면 치킨 거리 계산
    if count == m:
        for h in house:
            hx, hy = h[0], h[1]
            distance = 2 * n

            for c in select:
                cx, cy = c[0],  c[1]

                temp = abs(hx - cx) + abs(hy - cy)
                
                if temp < distance:
                    distance = temp
                
            total += distance

        if total < result:
            result = min(result, total)
    else: 
        for i in range(idx, k):
            select.append(chicken[i])
            dfs(count + 1, i + 1)
            select.pop()

for i in range(k):
    dfs(0, i)

print(result)