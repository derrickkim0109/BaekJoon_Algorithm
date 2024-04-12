import sys

input = sys.stdin.readline

formula = input().split('-')
num = []

for i in formula:
    s = 0
    temp = i.split('+')
    for j in temp:
        s += int(j)
    num.append(s)
    
result = num[0]

for i in range(1, len(num)):
    result -= num[i]
    
print(result)