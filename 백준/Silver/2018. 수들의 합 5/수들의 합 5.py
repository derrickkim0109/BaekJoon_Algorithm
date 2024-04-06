import sys

input = sys.stdin.readline

n = int(input())
nums = [i for i in range(1, n + 1)]

start, end = 0, 1
count = 0 

while start <= end and end <= n:
    value = sum(nums[start: end])

    if value < n:
        end += 1
    elif value == n:
        count += 1
        end += 1
    else: 
        start += 1

print(count)