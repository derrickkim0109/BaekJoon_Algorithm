let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var array = [Int]()
var answer = ""

func dfs() {
    if array.count == m,
        array.sorted() == array {
        print(array.map { String($0) }.joined(separator: " "))
        return
    }

    for i in 1...n {
        if !array.contains(i) {
            array.append(i)
            dfs()
            array.removeLast()
        }
    }
}

dfs()