import sys

input = sys.stdin.readline

n, k = map(int, input().split())

nums = list(map(int, input().split()))
left, right = 0, 0 
counter = [0 for _ in range(max(nums) + 1)]
result = 0

while right < n:
    if counter[nums[right]] < k:
        counter[nums[right]] += 1
        right += 1
    else:
        counter[nums[left]] -= 1
        left += 1

    result = max(result, right - left)

print(result)