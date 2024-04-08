import sys

input = sys.stdin.readline
number = [True] * 1000001

for i in range(2, int(len(number) ** 0.5) + 1):
    if number[i]:
        for j in range(2 * i, 1000001, i):
            number[j] = False

while True:
    n = int(input())

    if n == 0:
        break

    for i in range(n - 3, 2, -2):
        if (number[i] == True) and (number[n - i] == True):
            print(f"{n} = {n - i} + {i}")
            break
    else:
        print('"Goldbach\'s conjecture is wrong."')
