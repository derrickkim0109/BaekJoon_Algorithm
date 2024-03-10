let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0], m = nm[1]
var trueManList = readLine()!.split(separator: " ").map { Int($0)! }
var party = [[Int]]()
var graph = [[Int]](repeating: [], count: n+1)
var visited = [Bool](repeating: false, count: n+1)

for _ in 0..<m {
    let data = readLine()!.split(separator: " ").map { Int($0)! }
    let totalPeopleCount = data[0]
    let peopleSequence = Array(data[1...])

    party.append(peopleSequence)

    for i in 0..<totalPeopleCount {
        for j in i+1..<totalPeopleCount {
            let u = data[i+1], v = data[j+1]
            graph[u].append(v)
            graph[v].append(u)
        }
    }
}

func dfs(_ x: Int) {
    visited[x] = true
    for next in graph[x] where !visited[next] {
        dfs(next)
    }
}

// 진실을 알고 있는 사람들로부터 탐색 시작
for i in 1..<trueManList.count {
    dfs(trueManList[i])
}

// 진실을 모르는 사람만 있는 파티의 수 세기
let result = party.reduce(0) { count, p in
    let truthKnown = p.contains { visited[$0] }
    return count + (truthKnown ? 0 : 1)
}

print(result)
