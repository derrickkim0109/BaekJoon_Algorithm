import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let totalQueue = queue1 + queue2
    let totalSummary = totalQueue.map { $0 }.reduce(0, +)
    let targetSummary = totalSummary / 2
     
    var answer: Int = 0
    var startIndex: Int = 0
    var lastIndex: Int = queue1.count
    var leftQueueSummary = queue1.map { $0 }.reduce(0, +)

    if totalSummary % 2 != 0 {
        return -1
    }
    
    if targetSummary < queue1.max()!
    || targetSummary < queue2.max()! {
        return -1
    }
    
    while lastIndex < totalQueue.count && startIndex <= lastIndex {
        if leftQueueSummary == targetSummary {
            return answer
        }
        
        if leftQueueSummary > targetSummary {
            leftQueueSummary -= totalQueue[startIndex]
            startIndex += 1
        } else {
            leftQueueSummary += totalQueue[lastIndex]
            lastIndex += 1
        }
        
        answer += 1
    }
    
    return -1
}