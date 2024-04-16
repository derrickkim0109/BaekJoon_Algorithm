import sys

input = sys.stdin.readline

n, m = map(int, input().split())
nums = [int(input()) for _ in range(n)]

nums.sort()

# m이상 차이 나는 수열
result = float('inf')
left, right = 0, 0

while left <= right and right < n:
    value = nums[right] - nums[left]
    if value < m:
        right += 1
    else:
        result = min(result, value)
        left += 1

print(result)
    