import sys

input = sys.stdin.readline

n = int(input())
n_nums = list(map(int, input().split()))
n_nums.sort()

m = int(input())
m_nums = list(map(int, input().split()))

for mn in m_nums:
    start, end = 0, n - 1 
    mid1 = (start + end) / 2

    while start <= end:
        mid = int((start + end) / 2)
    
        if n_nums[mid] == mn:
            print(1)
            break 
        elif n_nums[mid] > mn:
            end = mid - 1
        else:
            start = mid + 1
    else:
        print(0)