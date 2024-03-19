n = int(input())
number = list(map(int, input().split()))
plus, minus, multiply, divide = list(map(int, input().split()))

maximum = -1_000_000_000 # 가능한 최솟값보다 작은 값으로 초기화
minimum = 1_000_000_000 # 가능한 최댓값보다 큰 값으로 초기화

def dfs(depth, total, plus, minus, multiply, divide):
    global maximum, minimum

    # 모든 숫자를 사용했을 때
    if depth == n:
        maximum = max(total, maximum)
        minimum = min(total, minimum)
        return 

    # 각 연산자에 대해 가능한 경우 탐색
    if plus:
        value = total + number[depth]
        dfs(depth + 1, value, plus - 1, minus, multiply, divide)
    if minus:
        value = total - number[depth]
        dfs(depth + 1, value, plus, minus - 1, multiply, divide)
    if multiply:
        value = total * number[depth]
        dfs(depth + 1, value, plus, minus, multiply - 1, divide)
    if divide:
        value = int(total / number[depth])
        dfs(depth + 1, value, plus, minus, multiply, divide - 1)

dfs(1, number[0], plus, minus, multiply, divide)        

print(maximum)
print(minimum)