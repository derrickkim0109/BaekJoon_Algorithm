import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    var answer = my_string.map { String($0) }
    
    while answer.count != n {
        answer.removeFirst()
    }
    
    return answer.joined()
}