import sys

input = sys.stdin.readline

n, m = list(map(int, input().split()))

n_arr = list(map(int, input().split()))
m_arr = list(map(int, input().split()))

result = []

nIdx, mIdx = 0, 0

while nIdx != len(n_arr) or mIdx != len(m_arr):
    if nIdx == len(n_arr):
        result.append(m_arr[mIdx])
        mIdx += 1
    elif mIdx == len(m_arr):
        result.append(n_arr[nIdx])
        nIdx += 1
    else:
        if n_arr[nIdx] < m_arr[mIdx]:
            result.append(n_arr[nIdx])
            nIdx += 1
        else:
            result.append(m_arr[mIdx])
            mIdx += 1

print(*result)