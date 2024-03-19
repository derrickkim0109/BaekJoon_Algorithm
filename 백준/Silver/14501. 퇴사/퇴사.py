n = int(input()) # 시험장의 개수
a = [list(map(int, input().split())) for _ in range(n)]
dp = [0 for _ in range(n + 1)]

for i in range(n):
    time = a[i][0]
    price = a[i][1]

    # i일에 시작해서 time 만큼의 기간이 소요되므로 = i + time
    # j는 새로운 상담을 시작할 수 있는 첫날
    for j in range(i + time, n + 1):
        # 상담을 했을 때 그 상담으로 인한 수익이 현재까지 계산된 최대 수익보다 더 크다면 최대 
        # 수익을 업데이트한다.
        if dp[j] < dp[i] + price:
            dp[j] = dp[i] + price

print(dp[-1])