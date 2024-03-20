import sys
from itertools import permutations
from copy import deepcopy

input = sys.stdin.readline
n, m, k = map(int, input().split())
graph = [list(map(int, input().split())) for _ in range(n)]
rotations = [list(map(int, input().split())) for _ in range(k)]

answer = float('inf')

def rotate_section(r, c, s, copy_graph):
    # 회전 이전의 값을 임시 저장
    left_top = copy_graph[r - s][c + s]
    top_row = copy_graph[r - s][c - s : c + s]
    bottom_row = copy_graph[r + s][c - s + 1 : c + s + 1]

    # 상단 가로줄 오른쪽으로 이동
    copy_graph[r - s][c - s + 1: c + s + 1] = top_row

    # 왼쪽 세로줄 위로 이동
    for row in range(r - s, r + s):
        copy_graph[row][c - s] = copy_graph[row + 1][c - s]
        
    # 하단 가로줄 왼쪽으로 이동
    copy_graph[r + s][c - s : c + s] = bottom_row
    
    # 오른쪽 세로줄 아래로 이동
    for row in range(r + s, r - s, -1):
        copy_graph[row][c + s] = copy_graph[row - 1][c + s]
    # 상단 가로줄의 처음 값을 오른쪽 세로줄 맨 위에 저장
    copy_graph[r - s + 1][c + s] = left_top
        
# 회전 순서 정하기 : 최대 6! = 720
# k개의 회전 연산을 포함하는 모든 가능한 순서 생성
for p in permutations(rotations, k):
    copy_graph = deepcopy(graph)

    # s는 회전을 수행할 정사각형의 반지름과 같은 역할 
    # 회전에 관련된 범위이다.
    for r, c, s in p:
        # 1부터 시작하는 숫자라 -1씩 감소
        r -= 1
        c -= 1
        # 가장 바깥쪽 사각형부터 안쪽 사각형으로 순서대로 회전 
        # 여기서 sValue는 회전할 사각형을 두께 
        for sValue in range(s, 0, -1):
            rotate_section(r, c, sValue, copy_graph)
    # 각 행의 최솟값 찾기
    for row in copy_graph:
        answer = min(answer, sum(row))

print(answer)