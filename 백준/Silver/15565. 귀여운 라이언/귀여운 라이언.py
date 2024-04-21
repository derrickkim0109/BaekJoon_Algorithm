import sys

input = sys.stdin.readline
INF = sys.maxsize
n, k = map(int, input().split())
dolls = list(map(int, input().rstrip().split()))

start, end = 0, k 
count = dolls[start : end + 1].count(1)
result = INF

while end != n:
    if count == k:
        result = min(result, end - start + 1)
        if dolls[start] == 1:
             count -= 1
        start += 1
    elif count < k:
        end += 1
        if end < n and dolls[end] == 1:
            count += 1
    else:
        if dolls[start] == 1:
            count -= 1
        start += 1
        
if result == INF:
    print(-1)
else:
    print(result)