from collections import deque

m, n, k = map(int, input().split())
# m 세로, n 가로, k 개의 직사각형 좌표

graph = [[0] * n for _ in range(m)]
dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]
result = []

for _ in range(k):
    x1, y1, x2, y2 = map(int, input().split())
    for i in range(x1, x2):
        for j in range(m - y1 - 1, m - y2 - 1, -1):
            graph[j][i] = 1

def bfs(x, y):
    q = deque()
    q.append((x, y))
    graph[x][y] = 1 
    size = 1

    while q:
        x, y = q.popleft()
        for i in range(4):
            nextX = x + dx[i]
            nextY = y + dy[i]
            
            if 0 <= nextX < m and 0 <= nextY < n and graph[nextX][nextY] == 0:
                graph[nextX][nextY] = 1
                q.append((nextX, nextY))
                size += 1
    result.append(size)

for x in range(m):
    for y in range(n):
        if graph[x][y] == 0:
            bfs(x, y)

result.sort()
print(len(result))
for i in result:
    print(i, end=" ") 
