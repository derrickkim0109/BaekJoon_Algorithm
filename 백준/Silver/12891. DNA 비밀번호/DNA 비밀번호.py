import sys
from collections import deque

input = sys.stdin.readline

s, p = list(map(int, input().split()))
word = list(str(input()))

A, C, G, T = list(map(int, input().split()))
dna_dict = {'A': 0, 'C': 0, 'G': 0, 'T': 0}

left, right = 0, p - 1
q = deque(word[left: right])
count = 0

for i in q:
    dna_dict[i] += 1

while right < s:
    dna_dict[word[right]] += 1

    if dna_dict['A'] >= A and dna_dict['C'] >= C and dna_dict['G'] >= G and dna_dict['T'] >= T:
        count += 1 

    dna_dict[word[left]] -= 1
    left += 1
    right += 1

print(count)
    