from collections import deque

m, n, h = map(int, input().split())

matrix = [[list(map(int, input().split())) for _ in range(n)] for _ in range(h)]
result = 0
dx, dy, dz = [-1,1,0,0,0,0], [0,0,-1,1,0,0], [0,0,0,0,-1,1]
q = deque([])

for i in range(h):
    for j in range(n):
        for k in range(m):
            if matrix[i][j][k] == 1:
                q.append([i, j, k])

def bfs():
    while q:
        x,y,z = q.popleft()
        
        for i in range(6):
            nx,ny,nz = x + dx[i], y + dy[i], z + dz[i]
            
            if 0 <= nx < h and 0 <= ny < n and 0 <= nz < m and matrix[nx][ny][nz] == 0:
                matrix[nx][ny][nz] = matrix[x][y][z] + 1               
                q.append([nx,ny,nz])    
                
                
bfs()

for i in matrix: 
    for j in i:
        for k in j:
            if k == 0:
                print(-1)
                exit(0)
        result = max(result, max(j))
        
print(result - 1)
    