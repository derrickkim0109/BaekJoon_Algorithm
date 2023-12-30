import Foundation

func solution(_ my_string:String, _ m:Int, _ c:Int) -> String {
    var array: [String] = my_string.map { String($0) }
    var answer = ""
    
    for index in stride(from: c - 1, to: my_string.count, by: m) {
        answer += array[index]
    }
    
    return answer
}