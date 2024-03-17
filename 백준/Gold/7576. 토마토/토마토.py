from collections import deque

m, n = map(int, input().split())

matrix = [list(map(int, input().split())) for _ in range(n)]
dx, dy = [-1,1,0,0], [0,0,-1,1]
result = 0

q = deque([])

for i in range(n):
    for j in range(m):
        if matrix[i][j] == 1:
            q.append([i, j])

def bfs():
    while q:
        x,y = q.popleft()
        
        for i in range(4):
            nx,ny = x + dx[i], y + dy[i]
            
            if 0 <= nx < n and 0 <= ny < m and matrix[nx][ny] == 0:
                matrix[nx][ny] = matrix[x][y] + 1
                q.append([nx, ny])
                
bfs()

for i in matrix:
    for j in i:
        if j == 0:
            print(-1)
            exit(0)
    result = max(result, max(i))
    
print(result - 1)