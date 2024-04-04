import sys

input = sys.stdin.readline

n, x = list(map(int, input().split()))
nums = list(map(int, input().split()))

result = sum(nums[:x])
temp = result
days = 1

for i in range(x, n):
    temp -= nums[i - x]
    temp += nums[i]
    
    if result < temp:
        result = temp
        days = 1
    elif result == temp:
        days +=1 

if result > 0:
    print(result)
    print(days)
else:
    print("SAD")