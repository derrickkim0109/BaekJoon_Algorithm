n = int(input())

s = [list(map(int, input().split())) for _ in range(n)]
visited = [False for _ in range(n)]
result = float('inf')  # 결과값 초기화, 최소값을 구해야 하므로 무한대로 설정

# count: 현재까지 선택된 스타트 팀의 사람 수
# idx: 현재 비교하고 있는 사람의 인덱스
def dfs(count, idx):
    global result

    # 절반으로 팀을 나눴을 때
    if count == n // 2:
        startTeam, linkTeam = 0, 0
        
        for i in range(n):
            for j in range(n):
                # i와 j가 같은 팀일 경우 능력치 합산
                if visited[i] and visited[j]:
                    startTeam += s[i][j]
                elif not visited[i] and not visited[j]:
                    linkTeam += s[i][j]
        # 스타트 팀과 링크 팀의 능력치 차이 계산
        result = min(result, abs(startTeam - linkTeam))
    else:
        # 모든 사람에 대해 탐색
        for i in range(idx, n):
            if not visited[i]:
                visited[i] = True
                dfs(count + 1, i + 1)
                visited[i] = False

dfs(0, 0) 
print(result)
