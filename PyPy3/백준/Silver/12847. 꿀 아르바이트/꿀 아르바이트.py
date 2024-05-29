import sys

input = sys.stdin.readline

n, m = map(int, input().split())
daily_money = list(map(int, input().split()))

start = 0
answer = sum_money = sum(daily_money[start: m])

for i in range(0, n - m):
    sum_money += daily_money[m + i] - daily_money[i]
    answer = max(answer, sum_money)
    
print(answer)