let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var array = [Int]()
var answer = ""

func dfs() {
    if array.count == m {
        answer += array.map { String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }

    for i in 1...n {
        array.append(i)
        dfs()
        array.removeLast()
    }
}

dfs()
print(answer)
