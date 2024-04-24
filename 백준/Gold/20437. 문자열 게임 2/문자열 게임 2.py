import sys
from collections import defaultdict
input = sys.stdin.readline

def find_min_max_substring(w, k):
    if k == 1:
        return 1, 1  # k가 1일 때는 무조건 길이가 1

    char_indices = defaultdict(list)
    min_length, max_length = float('inf'), 0
    
    # 각 문자의 모든 인덱스를 저장
    for index, char in enumerate(w):
        char_indices[char].append(index)
        # k개가 채워지는 순간부터 최소, 최대 길이 계산
        if len(char_indices[char]) == k:
            length = char_indices[char][-1] - char_indices[char][0] + 1
            min_length = min(min_length, length)
            max_length = max(max_length, length)
            # 가장 앞 인덱스를 제거하여 슬라이딩 윈도우 유지
            char_indices[char].pop(0)

    if min_length == float('inf'):
        return -1  # k번 이상 등장하는 문자가 없을 경우
    return min_length, max_length

t = int(input())

for _ in range(t):
    w = input()
    k = int(input())

    result = find_min_max_substring(w, k)
    if isinstance(result, tuple):
        print(' '.join(map(str, result)))
    else:
        print(result)