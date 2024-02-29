def solution(m, n, puddles):
    MOD = 1_000_000_007
    grid = [[0] * (m + 1) for _ in range(n + 1)]
    grid[1][1] = 1
    
    for puddle in puddles:
        x, y = puddle
        grid[y][x] = -1 

    for i in range(1, n + 1):
        for j in range(1, m + 1):
            if grid[i][j] == -1:
                continue
            if grid[i-1][j] > 0:
                grid[i][j] += grid[i-1][j] % MOD
            if grid[i][j-1] > 0:
                grid[i][j] += grid[i][j-1] % MOD
    
    return grid[n][m] % MOD
