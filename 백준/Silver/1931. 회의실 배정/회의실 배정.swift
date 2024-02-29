let totalMetting = Int(readLine()!)!
var meetings = [(Int, Int)]()
var now: Int = -1
var answer = 0

for _ in 0..<totalMetting {
    let meeting = readLine()!.split(separator: " ").map { Int($0)! }
    let startTime = meeting[0]
    let endTime = meeting[1]

    meetings.append((startTime, endTime))
}

meetings.sort { a, b in
    if a.1 == b.1 {
        return a.0 < b.0
    } else {
        return a.1 < b.1
    }
}

for meeting in meetings {
    if meeting.0 >= now {
        now = meeting.1
        answer += 1
    }
}

print(answer)
