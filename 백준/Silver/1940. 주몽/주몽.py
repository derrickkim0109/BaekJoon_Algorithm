import sys

input = sys.stdin.readline

n = int(input())
m = int(input())
nums = list(map(int, input().split()))
nums.sort()

start, end = 0, n - 1
count = 0

while start < end:
    value = nums[start] + nums[end]
    
    if value == m:
        count += 1
        start += 1
        end -= 1
    elif value < m:
        start += 1
    else: 
        end -= 1
    
print(count)