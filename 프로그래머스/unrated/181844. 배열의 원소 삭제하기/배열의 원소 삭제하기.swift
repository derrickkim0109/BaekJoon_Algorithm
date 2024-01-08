import Foundation

func solution(_ arr:[Int], _ delete_list:[Int]) -> [Int] {
    var answer = arr
    
    for (i, dElement) in delete_list.enumerated() {
        if let index = answer.firstIndex(of: dElement) {
            answer.remove(at: index)
        }
    }
    
    return answer
}