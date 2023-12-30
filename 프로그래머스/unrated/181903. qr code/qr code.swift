import Foundation

func solution(_ q:Int, _ r:Int, _ code:String) -> String {
    let array = code.map { String($0) }
    var answer = ""

    for index in 0..<array.count {
        if index % q == r {
            answer += array[index]
        }
    }

    return answer
}