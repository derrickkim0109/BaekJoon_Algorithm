import Foundation

func solution(_ todo_list:[String], _ finished:[Bool]) -> [String] {
    var answer = [String]()
    
    for (index, value) in finished.enumerated() {
        if value == false {
            answer.append(todo_list[index])
        }
    }
    
    return answer
}