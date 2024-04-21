from sys import stdin
input = stdin.readline

def check_palindrome(word):
    l, r = 0, len(word) - 1

    while l < r:
        if word[l] != word[r]:
            # 왼쪽 문자를 제거하거나 오른쪽 문자를 제거했을 때 회문인지 검사
            if is_sub_palindrome(word, l+1, r) or is_sub_palindrome(word, l, r-1):
                return 1  # 유사 회문
            else:
                return 2  # 회문도, 유사 회문도 아님
        l += 1
        r -= 1

    return 0  # 완벽한 회문

def is_sub_palindrome(word, l, r):
    while l < r:
        if word[l] != word[r]:
            return False
        l += 1
        r -= 1
    return True

t = int(input())

for _ in range(t):
    word = input().rstrip()
    print(check_palindrome(word))
