import Foundation

func solution(_ str1:String, _ str2:String) -> String {
    let firstArray = str1.map { String($0) }
    let secondArray = str2.map { String($0) }
    
    var result: String = ""
    
    for i in 0..<firstArray.count {
        let combinedString = firstArray[i] + secondArray[i]
        result += combinedString
    }
    
    return result
}