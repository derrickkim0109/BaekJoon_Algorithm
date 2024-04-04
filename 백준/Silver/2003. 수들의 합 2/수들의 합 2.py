import sys

input = sys.stdin.readline

n, m = list(map(int, input().split()))
nums = list(map(int, input().split()))

start, end = 0, 1
count = 0

while end <= n and start <= end:
    total = sum(nums[start:end])
    
    if total == m:
        count += 1
        end += 1
    elif total < m:
        end += 1
    else: 
        start += 1
    
print(count)