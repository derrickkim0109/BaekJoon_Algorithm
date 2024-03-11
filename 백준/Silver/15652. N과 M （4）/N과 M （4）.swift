let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var array = [Int]()
var answer = ""

func dfs(_ start: Int) {
    if array.count == m,
       array.sorted(by: { $0 < $1} ) == array {
        answer += array.map { String($0) }.joined(separator: " ")
        answer += "\n"
        return
    }

    for i in start...n {
        array.append(i)
        dfs(i)
        array.removeLast()
    }
}

dfs(1)
print(answer)
