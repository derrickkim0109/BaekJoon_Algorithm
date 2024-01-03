import Foundation

func solution(_ my_string:String, _ alp:String) -> String {
    var array = my_string.map { String($0) }
    var answer = ""
    
    for i in 0..<array.count {
        if array[i] == alp {
            answer += array[i].uppercased()
        } else {
            answer += array[i]
        }
    }
    
    return answer
}