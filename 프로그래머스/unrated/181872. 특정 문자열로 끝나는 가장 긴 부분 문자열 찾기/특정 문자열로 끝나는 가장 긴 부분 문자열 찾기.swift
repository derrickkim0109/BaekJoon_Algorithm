import Foundation

func solution(_ myString:String, _ pat:String) -> String {
    let startIndex = myString.range(of: pat)?.lowerBound ?? myString.startIndex
    let endIndex = myString.range(of: pat, options: .backwards)?.upperBound ?? myString.endIndex
    let answer = String(myString[..<endIndex])
    return answer
}