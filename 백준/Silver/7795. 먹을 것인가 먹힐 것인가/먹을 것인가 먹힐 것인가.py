import sys

input = sys.stdin.readline

t = int(input())

def binary_search(B, A):
    start, end = 0, len(B) - 1
    result = -1

    while start <= end:
        mid = (start + end) // 2

        if B[mid] < A:
            result = mid
            start = mid + 1
        else:
            end = mid - 1
            
    return result
    
for _ in range(t):
    n, m = map(int, input().split())
    a = sorted(list(map(int, input().split())))
    b = sorted(list(map(int, input().split())))
    count = 0

    for li in a: 
        count += (binary_search(b, li) + 1)

    print(count)