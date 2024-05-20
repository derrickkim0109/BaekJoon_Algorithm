import sys

input = sys.stdin.readline

n, k = map(int, input().split())

# g_i: 얼음 양
# x_i: 양동이 좌표
graph = [list(map(int, input().split())) for _ in range(n)]
ice = [0] * 1_000_001

for i in range(n):
    x, g = graph[i][1], graph[i][0]
    ice[x] = g

next = 2 * k + 1

window = sum(ice[:next])
answer = window

for i in range(next, 1_000_001):
    window += (ice[i] - ice[i - next])
    answer = max(answer, window)

print(answer)