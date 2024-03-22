import sys
from itertools import combinations
from collections import deque

# 입력 처리
input = sys.stdin.readline
n, m, d = map(int, input().split())  # n: 행의 수, m: 열의 수, d: 궁수의 공격 거리 제한
graph = [list(map(int, input().split())) for _ in range(n)]  # 0은 빈 칸, 1은 적이 있는 칸

# 궁수의 공격 결과 시뮬레이션
def simulate_attack(archers):
    temp_graph = [row[:] for row in graph]  # 격자판 복사본 생성(얕은 복사)
    killed = 0  # 적군을 제거한 수

    # 각 턴마다 적군이 한 칸씩 아래로 이동
    for row in range(n):
        enemies_to_attack = []

        # 모든 궁수에 대해 공격 시도
        for archer_col in archers:
         # 궁수의 공격 거리 제한 D 내에서 각 거리별로 적을 찾는 반복문
            for distance in range(1, d + 1):
                found_enemy = False  # 가장 가까운 적을 찾았는지 여부를 저장하는 플래그
    
                # 궁수로부터 현재 거리에서 가능한 모든 수평 위치를 순회
                for dx in range(-distance + 1, distance):
                    archer_row = n - row  # 궁수의 현재 행 위치 계산 (맨 아래 행에서 시작하여 위로 이동)
                    enemy_col = archer_col + dx  # 적의 열 위치 계산 (궁수 위치로부터 좌우로 dx만큼 이동한 위치)
                    enemy_row = archer_row - (distance - abs(dx))  # 적의 행 위치 계산 (맨해튼 거리를 고려하여 계산)
    
                    # 찾은 적의 위치가 격자판 내에 있고, 적이 실제로 있는 칸이라면
                    if 0 <= enemy_row < n and 0 <= enemy_col < m and temp_graph[enemy_row][enemy_col] == 1:
                        enemies_to_attack.append((enemy_row, enemy_col))  # 공격 대상 목록에 적의 위치 추가
                        found_enemy = True  # 가장 가까운 적을 찾았으므로 플래그를 True로 설정
                        break  # 가장 가까운 적을 찾았으므로, 더 이상의 거리 탐색을 중단하고 다음 궁수로 이동
    
                # 가장 가까운 적을 찾았다면 현재 궁수에 대한 루프 중단
                if found_enemy:
                    break

        # 공격 받은 적 제거
        for enemy in set(enemies_to_attack):
            if temp_graph[enemy[0]][enemy[1]] == 1:
                temp_graph[enemy[0]][enemy[1]] = 0
                killed += 1

    return killed

result = 0
# 가능한 모든 궁수의 위치 조합에 대해 시뮬레이션 실행
for archers in combinations(range(m), 3):
    result = max(result, simulate_attack(archers))

print(result)
