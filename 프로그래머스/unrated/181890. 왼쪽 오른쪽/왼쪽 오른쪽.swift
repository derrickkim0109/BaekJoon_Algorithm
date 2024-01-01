import Foundation

func solution(_ str_list:[String]) -> [String] {    
    for i in 0..<str_list.count {
        if str_list[i] == "l" {
            let index = i - 1
            return str_list[...index].map { $0 }
        } else if str_list[i] == "r" {
            let index = i + 1
            return str_list[index...].map { $0 }
        }
    }
    
    return []
}
