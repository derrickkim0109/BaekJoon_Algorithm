import sys

input = sys.stdin.readline

# n은 초밥 벨트에 놓인 접시 수
# d는 초밥의 가짓수
# k는 연속해서 먹는 접시 수 
# c는 추가로 먹을 수 있는 쿠폰 번호
n, d, k, c = list(map(int, input().split()))
arr = [int(input()) for _ in range(n)]

left, right = 0, 0
answer = 0

while left != n:
    right = left + k
    case = set()
    addable = True

    for i in range(left, right):
        i %= n
        case.add(arr[i])
        if arr[i] == c:
            addable = False

    count = len(case)
    if addable:
        count += 1

    answer = max(answer, count)
    left += 1

print(answer)


# from collections import defaultdict
# left, right = 0, k - 1
#
# dict = defaultdict(int)
# dict[c] = 1

# for i in range(right + 1):
#     dict[arr[i]] += 1

# result = -int(1e9)

# while left < n:
#     result = max(result, len(dict))

#     dict[arr[left]] -= 1

#     if dict[arr[left]] == 0:
#        del dict[arr[left]]

#     left += 1
#     right += 1
#     dict[arr[right % n]] += 1

# print(result)