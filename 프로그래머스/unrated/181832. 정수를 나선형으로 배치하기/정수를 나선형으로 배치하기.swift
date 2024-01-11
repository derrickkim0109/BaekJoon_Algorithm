import Foundation

func solution(_ n:Int) -> [[Int]] {
    var directionArray = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    var answer = Array(repeating: Array(repeating: 0, count: n), count: n)
    var x = 0
    var y = 0
    var dir = 0
    var num = 1
    
    while num <= n * n {
        answer[x][y] = num
        
        var nextX = x + directionArray[dir][0]
        var nextY = y + directionArray[dir][1]
        
        if nextX >= n
            || nextX < 0
            || nextY >= n
            || nextY < 0
            || answer[nextX][nextY] != 0 {
                dir = (dir + 1) % 4
                nextX = x + directionArray[dir][0]
                nextY = y + directionArray[dir][1]
            }
        
        x = nextX
        y = nextY
        num += 1
    }
    
    return answer
}