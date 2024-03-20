import sys

input = sys.stdin.readline
n, m, x, y, k = map(int, input().split())

board = [list(map(int, input().split())) for _ in range(n)]
comm = list(map(int, input().split()))

dx = [0, 0, -1, 1] # 북, 남
dy = [1, -1, 0, 0] # 동, 서

dice = [0, 0, 0, 0, 0, 0]

# 주사위 이동 후 면 변화 처리
def turn(dir):
    a, b, c, d, e, f = dice[0:]
    if dir == 1: #동
        dice[0:] = d, b, a, f, e, c

    elif dir == 2: #서
        dice[0:] = c, b, f, a, e, d

    elif dir == 3: #북
        dice[0:] = e, a, c, d, f, b

    else:
        dice[0:] = b, f, c, d, a, e

# 주사위 이동 및 상호작용 처리
nx, ny = x, y

for i in comm:
    nx += dx[i-1]
    ny += dy[i-1]

    # 지도 바깥으로 이동 시 명령 무시
    if nx < 0 or nx >= n or ny < 0 or ny >= m:
        nx -= dx[i-1]
        ny -= dy[i-1]
        continue

    turn(i)
    if board[nx][ny] == 0:
        board[nx][ny] = dice[-1]
    else:
        dice[-1] = board[nx][ny]
        board[nx][ny] = 0

    print(dice[0])