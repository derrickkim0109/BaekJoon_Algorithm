def solution(triangle):
    dp = [[0 for _ in range(len(row))] for row in triangle]
    
    dp[-1] = triangle[-1]
    
    for i in range(len(triangle) - 2, -1, -1):
        for j in range(len(triangle[i])):
            dp[i][j] = triangle[i][j] + max(dp[i+1][j], dp[i+1][j+1])
    
    return dp[0][0]
