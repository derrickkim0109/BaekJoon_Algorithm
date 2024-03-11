let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let b = input[1]
let c = input[2]

func dfs(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if b == 1 {
        return a
    }

    if b % 2 != 0 {
        return a * dfs(a, b - 1, c)
    }

    let halfValue = dfs(a, b / 2, c) % c

    return halfValue * halfValue % c
}

print(dfs(a, b, c) % c)
