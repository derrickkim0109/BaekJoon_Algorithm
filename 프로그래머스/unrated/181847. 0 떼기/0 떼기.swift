import Foundation

func solution(_ n_str:String) -> String {
    var answer = n_str.map { String($0) }
    
    for char in answer {
        if answer.first! == "0" {
            answer.removeFirst()
        }
    }
    
    return answer.joined()
}