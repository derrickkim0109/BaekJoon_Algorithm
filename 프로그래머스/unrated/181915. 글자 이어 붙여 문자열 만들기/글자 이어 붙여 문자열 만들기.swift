import Foundation

func solution(_ my_string:String, _ index_list:[Int]) -> String {
    let words = my_string.map { String($0) }
    var answer = ""
    
    for i in index_list {
        answer += words[i]
    }
    
    return answer
}