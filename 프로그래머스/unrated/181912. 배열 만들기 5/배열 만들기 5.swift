import Foundation

func solution(_ intStrs:[String], _ k:Int, _ s:Int, _ l:Int) -> [Int] {
    var answer = [Int]()
    
    for numStr in intStrs {
        let startIndex = numStr.index(numStr.startIndex, offsetBy: s)
        let endIndex = numStr.index(numStr.startIndex, offsetBy: s + l)
        let value = numStr[startIndex..<endIndex]

        if let number = Int(value),
           number > k {
            answer.append(number)    
        }
    }
    
    return answer
}