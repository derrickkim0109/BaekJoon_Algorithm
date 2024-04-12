import sys

input = sys.stdin.readline

n = int(input())
total = 0
count = 0

while True:
    count += 1
    total += count
    if total > n:
        break
print(count - 1)