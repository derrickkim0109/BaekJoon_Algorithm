import sys
from itertools import combinations
from collections import deque, defaultdict

input = sys.stdin.readline
n = int(input())
people = list(map(int, input().split()))
graph = defaultdict(list)
result = float('inf')

def bfs(nodes):
    start = nodes[0]
    q = deque([start])
    visited = set([start])
    _sum = 0 
    
    while q:
        current = q.popleft()
        _sum += people[current]
        
        for node in graph[current]:
            if node not in visited and node in nodes:
                q.append(node)
                visited.add(node)

    return _sum, len(visited)

for i in range(n):
    info = list(map(int, input().split()))
    amount = info[0]
    
    for j in range(1, amount + 1):
        graph[i].append(info[j] - 1)
        
for i in range(1, n // 2 + 1):
    combis = list(combinations(range(n), i))
    
    for comb in combis:
        sum1, v1 = bfs(comb)
        sum2, v2 = bfs([i for i in range(n) if i not in comb])
        
        if v1 + v2 == n:
            result = min(result, abs(sum1 - sum2))

if result != float('inf'):
    print(result)
else:
    print(-1)