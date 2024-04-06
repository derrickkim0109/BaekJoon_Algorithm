import sys

input = sys.stdin.readline

n = int(input())
nums = list(map(int, input().split()))
nums.sort()
count = 0

for i in range(n):
    target = nums[i]
    start, end = 0, n - 1
    
    while start < end:
        value = nums[start] + nums[end]
        
        if value == target:
            if start == i:
                start += 1
            elif end == i:
                end -= 1
            else:
                count += 1
                break
        elif value < target:
            start += 1
        elif value > target:
            end -= 1

print(count)