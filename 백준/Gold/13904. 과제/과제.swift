// 과제의 개수를 입력받습니다.
let n = Int(readLine()!)!
// 과제의 마감일과 점수를 저장할 배열을 초기화합니다.
var arr = [(dueDate: Int, score: Int)]()
// 마감일이 사용되었는지 확인하기 위한 배열을 초기화합니다. 최대 1000일까지 고려합니다.
var visited = [Bool](repeating: false, count: 1001)
// 얻을 수 있는 점수의 합계를 저장할 변수를 초기화합니다.
var sum = 0

// n개의 과제 정보(마감일과 점수)를 입력받아 arr 배열에 저장합니다.
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append((input[0], input[1]))
}

// 과제를 점수가 높은 순으로 정렬합니다. 점수가 높은 과제부터 선택하기 위함입니다.
arr.sort(by: {$0.score > $1.score})

// 정렬된 과제 배열을 순회합니다.
for x in arr {
    // 과제의 마감일을 dueDate 변수에 저장합니다.
    var dueDate = x.dueDate
    // 해당 마감일이 이미 선택되었거나(visited[dueDate] == true), dueDate가 0보다 큰 동안 반복합니다.
    while visited[dueDate], dueDate > 0 {
        // 이미 선택된 마감일이라면, 하루 전으로 이동합니다.
        dueDate -= 1
    }

    // 유효한 마감일(0이 아닌)을 찾았다면,
    if dueDate != 0 {
        // 해당 마감일을 선택되었다고 표시합니다.
        visited[dueDate] = true
        // 해당 과제의 점수를 합계에 추가합니다.
        sum += x.score
    }
}

// 최종적으로 선택된 과제들의 점수 합계를 출력합니다.
print(sum)

