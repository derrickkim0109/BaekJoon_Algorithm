import Foundation

func solution(_ num_list:[Int]) -> Int {
    var even = ""
    var odd = ""
    for num in num_list {
        if num % 2 == 0 {
            even += "\(num)"
        } else {
            odd += "\(num)"
        }
    }
    
    return Int(even)! + Int(odd)!

}