import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var count = 0

    for i in 0..<t.count - p.count + 1 {
        let endNum = i + p.count - 1
        let startIndex = t.index(t.startIndex, offsetBy: i)
        let endIndex = t.index(t.startIndex, offsetBy: endNum)
        let num = t[startIndex...endIndex]

        if Int64(num) ?? 0 <= Int64(p)! {
            count += 1
        }
    }
    
    return count
}