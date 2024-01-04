import Foundation

func solution(_ myString:String, _ pat:String) -> Int {
    var answer = 0
        
    for i in stride(from: myString.count - 1, through: 0, by: -1) {
        let subStr = String(myString.prefix(i + 1))
        if subStr.hasSuffix(pat) {
            answer += 1
        }
    }

    return answer
}