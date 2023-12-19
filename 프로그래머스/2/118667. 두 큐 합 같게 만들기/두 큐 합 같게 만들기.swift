import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    // 기준이 첫 Queue or 두 번째 Queue로 할지 알아야 한다. 
    // pop과 insert는 한쌍으로 생각해야 한다.
    // 모든 원소의 합
    var answer: Int = 0
    
    let leftQueue = queue1
    var rightQueue = queue2
    
    var leftOffset: Int = 0
    var rightOffset: Int = queue1.count
    
    var totalQueue = leftQueue + rightQueue
    var leftQueueSummary = queue1.map { $0 }.reduce(0, +)
    
    let totalSummary = totalQueue.map { $0 }.reduce(0, +)
    let targetSummary = totalSummary / 2 
     
    if totalSummary % 2 != 0 {
        return -1
    }
    
    if targetSummary < leftQueue.max()! 
    || targetSummary < rightQueue.max()! {
        return -1
    }
    
    while rightOffset < totalQueue.count && leftOffset <= rightOffset {
        if leftQueueSummary == targetSummary {
            return answer
        }
        
        if leftQueueSummary > targetSummary {
            leftQueueSummary -= totalQueue[leftOffset]
            leftOffset += 1
        } else {
            leftQueueSummary += totalQueue[rightOffset]
            rightOffset += 1
        }
        
        answer += 1
    }
    
    return -1
}