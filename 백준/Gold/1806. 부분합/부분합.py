import sys

input = sys.stdin.readline

# 연속된 수들의 부분합이 s 이상이 되는 것을 찾아야 함
n, s = list(map(int, input().split()))
nums = list(map(int, input().split()))

start, end = 0, 0
result = float('inf')
total = sum(nums[start: end]) 

while start <= end:
    if total >= s:
        result = min(result, end - start)
        total -= nums[start]
        start += 1
    elif end == n: 
        break
    else:
        total += nums[end]
        end += 1
    
if result == float('inf'):
    print(0)
else:
    print(result)