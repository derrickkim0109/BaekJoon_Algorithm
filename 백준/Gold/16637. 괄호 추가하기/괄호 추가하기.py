import sys
import re

input = sys.stdin.readline
n = int(input())
expr = input()

token = re.findall(r'\d+|\D', expr)
maximum = float('-inf')

def dfs(i, value):
    global maximum

    if i == n:
        maximum = max(maximum, int(value))
        return 

    # 괄호 사용 O
    if i + 4 <= n:
        a = [value, token[i]]
        b = [str(eval(''.join(token[i + 1 : i + 4])))]
        f = eval(''.join(a + b))
        dfs(i + 4, str(f))
    # 괄호 사용 X
    if i + 2 <= n:
        a = [value]
        b = token[i : i + 2]
        f = eval(''.join(a + b))
        dfs(i + 2, str(f))

dfs(1, token[0])
print(maximum)