import sys
from collections import deque

input = sys.stdin.readline

n,m = map(int, input().split())

graph = []

dx = [0, 0, -1, 1]
dy = [-1, 1, 0, 0]

for _ in range(n):
    graph.append(list(map(int, input().rstrip())))

def bfs(x, y):
    queue = deque()
    queue.append((x,y))

    while queue:
        x, y = queue.popleft()

        for i in range(4):
            nextX = x + dx[i]
            nextY = y + dy[i]

            if 0 <= nextX < n and 0 <= nextY < m and graph[nextX][nextY] == 1:
                queue.append((nextX, nextY))
                graph[nextX][nextY] = graph[x][y] + 1

    return graph[n - 1][m - 1]

print(bfs(0, 0))
