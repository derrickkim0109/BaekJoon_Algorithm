import sys 

input = sys.stdin.readline

n, k = list(map(int, input().split()))
nums = list(map(int, input().split()))

result = [sum(nums[:k])]

for i in range(n - k):
    result.append(result[i] - nums[i] + nums[i + k])

print(max(result))