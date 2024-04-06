import sys

input = sys.stdin.readline
INF = sys.maxsize

n = int(input())
nums = list(map(int, input().split()))

nums.sort()

start, end = 0, n - 1
minValue = INF

answer = []

while start < end:
    value = nums[start] + nums[end]

    if abs(value) < minValue:
        minValue = abs(value)
        answer = [nums[start], nums[end]]

    if value < 0:
        start += 1
    elif value > 0:
        end -= 1
    else:
        break
    
print(*answer)