import sys
from collections import deque

input = sys.stdin.readline

n = int(input())
nums = deque([i for i in range(1, n + 1)])

while len(nums) != 1:
    nums.popleft()
    moving_num = nums.popleft()
    nums.append(moving_num)
else:
    print(nums[0])