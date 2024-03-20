import sys
import re
# '3', '+', '8', '*', '7', '-', '9', '*', '2'
# + 연산자에 괄호를 생성한다면, 그 다음 연산자인 *에서는 괄호 생성이 불가능하다.
# 예) ((3 + 8) * 7) <- 문제에서 불가능하다 설정

# 1. 괄호를 생성한 연산자 구간은 무조건 다음 연산자에서는 괄호를 생성할 수 없다.
# dfs 사용. 연산 기호는 1,3,5,..인덱스 홀수 구간에 존재하기 때문에 i = 1부터 시작

# 2. 괄호를 사용한다는 건 먼저 i + 2 연산 후 i 연산을 한다는 의미이다. 
# 그렇기 때문에 i + 4로 이동한다.
# 3. 괄호를 사용한지 않는 건 i 구간의 연산을 진행한 후 i + 2로 넘어가면 된다.
# 4. index error를 방지하기 위해 괄호를 사용하는 dfs를 돌기 전 if문으로 범위 체크를 진행
# 5. i == n이 되면 value값을 비교해서 maximum값을 업데이트한다.
# eval(), join()내장 함수를 사용
# 3에서 괄호를 생성한다면 1 -> 3 -> 7에서 괄호가 생성된다.
# (3 + 8) * 7 - (9 + 2) = 77 - 11 = 66
# 3 + (8 * 7)
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
