import sys

input = sys.stdin.readline

N, K = map(int, input().split())
S = list(map(int,input().split()))

def longest_even_subsequence(N, K, S):
    left = 0
    max_length = 0
    odd_count = 0

    for right in range(N):
        if S[right] % 2 != 0:
            odd_count += 1
        
        while odd_count > K:
            if S[left] % 2 != 0:
                odd_count -= 1
            left += 1
        
        # 현재 부분 수열에서 짝수만의 길이를 계산
        even_length = right - left + 1 - odd_count
        max_length = max(max_length, even_length)
    
    return max_length


print(longest_even_subsequence(N, K, S))