import sys

input = sys.stdin.readline

T = int(input())
N = [int(input()) for _ in range(T)]

def printSum(p, s):
    for i in p:
        for j in p:
            for k in p:
                if i + j + k == s:
                    print(i, j, k)
                    return 

def find_prime_number(x):
    data = list(range(2, x + 1))

    result = []

    while len(data) != 0:
        m = data[0]
        result.append(m)
        count = 0
        while count < len(data):
            if data[count] % m == 0:
                data.pop(count)
                count -= 1
            count += 1

    return result

for n in N: 
    printSum(find_prime_number(n), n)