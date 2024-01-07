import Foundation

func solution(_ strArr:[String]) -> Int {
    var groupCountMap = [String: Int]()

    for str in strArr {
        let key = String(repeating: "*", count: str.count)
        groupCountMap[key, default: 0] += 1
    }

    if let maxCount = groupCountMap.values.max() {
        return maxCount
    } else {
        return 0
    }
}