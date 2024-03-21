import sys

input = sys.stdin.readline
n = int(input())
graph = [list(map(int, input().split())) for _ in range(n)] # 격자판의 상태를 입력받음, 빈 칸은 0, 벽은 1로 표시됨
result = 0 # 이동 방법의 수

def dfs(info):
    global result

    # 현재 파이프의 위치(x, y)와 방향(direction) 정보를 가져옴
    x, y, direction = info

    # 파이프의 한쪽 끝이 목표 지점(n-1, n-1)에 도달한 경우, 결과값을 1 증가시키고 리턴
    if x == n - 1 and y == n - 1:
        result += 1
        return 

    # 대각선 이동
    if x + 1 < n and y + 1 < n:
        if graph[x + 1][y] == 0 and graph[x][y + 1] == 0 and graph[x + 1][y + 1] == 0:
            dfs((x + 1, y + 1, 2))
            
    # 가로 이동
    # 현재 파이프가 세로 또는 대각선 방향일 때 세로 이동 가능
    if direction == 1 or direction == 2:
        if x + 1 < n and graph[x + 1][y] == 0:
            dfs((x + 1, y, 1))
    
    # 세로 이동
    # 현재 파이프가 가로 또는 대각선 방향일 때 가로 이동 가능
    if direction == 0 or direction == 2:
        if y + 1 < n and graph[x][y + 1]  == 0:
            dfs((x, y + 1, 0))
            
dfs((0, 1, 0))
print(result)