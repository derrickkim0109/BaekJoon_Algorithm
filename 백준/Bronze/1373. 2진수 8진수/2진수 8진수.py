import sys

input = sys.stdin.readline

n = input()

oct_num = oct(int(n, 2))

print(oct_num[2:])

