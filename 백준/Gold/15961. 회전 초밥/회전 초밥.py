import sys
from collections import defaultdict

input = sys.stdin.readline

# n: 벨트에 놓인 접시의 수, d: 초밥의 가짓수
# k: 연속해서 먹는 접시의 수, c: 쿠폰 번호
n, d, k, c = list(map(int, input().split()))

# 벨트 상의 초밥 종류
arr = [int(input()) for _ in range(n)]

def solve():
    left = 0
    right = 0
    dict = defaultdict(int)
    result = 0
    # k만큼 먹기
    while right < k:
        dict[arr[right]] += 1
        right += 1

    # c는 반드시 추가
    dict[c] += 1

    # 슬라이딩 윈도우
    while left < n:
        result = max(result, len(dict))
        # 1. 맨 왼쪽 초밥 제거
        dict[arr[left]] -= 1
        # 삭제된 왼쪽 초밥이 0 이면 dict 삭제
        if dict[arr[left]] == 0:
            del dict[arr[left]]
        dict[arr[right % n]] += 1
        left += 1
        right += 1

    return result

print(solve())