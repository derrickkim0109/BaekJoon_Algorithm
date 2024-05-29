import sys

input = sys.stdin.readline

n, s = map(int, input().split())
cow = list(int(input().rstrip()) for _ in range(n))
cow.sort()

start, end = 0, len(cow) - 1
count = 0

while start < end:
    pair = cow[start] + cow[end]
    
    if pair > s:
        end -= 1

    else: 
        count += end - start
        start += 1

print(count)