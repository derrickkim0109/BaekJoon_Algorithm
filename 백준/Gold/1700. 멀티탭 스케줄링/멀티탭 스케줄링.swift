// 입력 받기
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let N = firstLine[0] // 멀티탭 구멍의 개수
let K = firstLine[1] // 전기 용품의 총 사용횟수
let devices = readLine()!.split(separator: " ").map { Int($0)! }

var outlets = [Int]() // 현재 멀티탭에 꽂혀 있는 기기
var removeCount = 0

for i in 0..<K {
    let device = devices[i]

    // 이미 꽂혀있다면 건너뛰기
    if outlets.contains(device) {
        continue
    }

    // 멀티탭에 빈 공간이 있다면 그냥 꽂기
    if outlets.count < N {
        outlets.append(device)
        continue
    }

    // 빈 공간이 없다면, 가장 나중에 사용되거나 전혀 사용되지 않을 기기를 찾아서 빼기
    var lastIndex = -1
    var deviceToReplace = -1
    for outlet in outlets {
        if let index = devices[i...].firstIndex(of: outlet) {
            if index > lastIndex {
                lastIndex = index
                deviceToReplace = outlet
            }
        } else {
            deviceToReplace = outlet
            break
        }
    }

    if let index = outlets.firstIndex(of: deviceToReplace) {
        outlets.remove(at: index) // 가장 나중에 사용되는 기기 빼기
        removeCount += 1
    }

    outlets.append(device) // 새 기기 꽂기
}

print(removeCount)