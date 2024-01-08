import Foundation

func solution(_ str_list:[String], _ ex:String) -> String {
    var answer = ""
    
    for w in str_list {
        if !w.contains(ex) {
            answer += w
        }
    }
    
    return answer
}