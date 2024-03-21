import sys
from itertools import permutations

input = sys.stdin.readline
n = int(input()) # n 이닝 
game = [list(map(int, input().split())) for _ in range(n)]

# 조건
# 1. 한 이닝에 3아웃이 발생한면 이닝 종료
# 2. 9번 타자까지 공 쳤는데 3아웃이 발생하지 않으면 이닝 종료안함
# 3. 1번 이닝에서 6번 타자가 마지막이면 2번 이닝은 7번 타자부터 시작
# 4. 경기가 시작하기 전에 타순을 정해줘야 함. 단 4번 타자는 1번 선수
order = [i for i in range(1, 9)] 
result = float('-inf')

# 8명 순서의 조합을 따져 본다.
for p in permutations(order, 8):
    playerlist = list(p)
    
    # 4번 조건. 1~3번 타자(랜덤 3명) / 1번 선수(4번 타자) / 4 ~ 8 번 타자(랜덤 5명)
    player_order = playerlist[:3] + [0] + playerlist[3:] 

    # 타수, 점수
    idx, score = 0, 0

    for game_idx in range(n):
        # 이닝 돌면서 out 초기화
        out = 0
        # 1 ~ 3루
        p1, p2, p3 = 0, 0, 0

        # out 전까지 1,2번 조건 반복
        # 0: out, 1: 안타, 2: 2루타, 3: 3루타, 4: 홈런
        while out < 3:
            if game[game_idx][player_order[idx]] == 0:
                out += 1
            elif game[game_idx][player_order[idx]] == 1:
                score += p3
                p1, p2, p3 = 1, p1, p2
            elif game[game_idx][player_order[idx]] == 2:
                score += p2 + p3
                p1, p2, p3 = 0, 1, p1
            elif game[game_idx][player_order[idx]] == 3:
                score += p1 + p2 + p3 
                p1, p2, p3 = 0, 0, 1
            elif game[game_idx][player_order[idx]] == 4:
                score += p1 + p2 + p3 + 1
                p1, p2, p3 = 0, 0, 0

            # 타순 증가시킨다.
            idx += 1
            if idx == 9:
                idx = 0
    result = max(result, score)

print(result)