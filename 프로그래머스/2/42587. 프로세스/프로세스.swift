import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var p = priorities
    var targetIndex = location

    while true {
        if p.contains(where: { $0 > p[0] }) {
            p.append(p[0])
            p.removeFirst()

            targetIndex = (targetIndex - 1 < 0) ? (p.count - 1) : (targetIndex - 1)
        } else {
            if targetIndex == 0 {
                return priorities.count - p.count + 1
            }

            p.removeFirst()
            targetIndex -= 1
        }
    }
    
    return targetIndex
}