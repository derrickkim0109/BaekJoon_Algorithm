import sys

input = sys.stdin.readline

while True:
    n, m = map(int, input().split())
    
    if n == 0 and m == 0:
        exit(0)
        
    mans = [int(input()) for _ in range(n)]
    womans = [int(input()) for _ in range(m)]
    
    man_index, woman_index, total_count = 0, 0, 0
    
    while man_index < n and woman_index < m:
        man = mans[man_index]
        woman = womans[woman_index]
        
        if man == woman:
            total_count += 1
            man_index += 1
            woman_index += 1
        elif man > woman:
            woman_index += 1
        else:
            man_index += 1
            
    print(total_count)