import Foundation

func solution(_ num_list:[Int]) -> Int {
    var odd = 0
    var even = 0
    
    for (index, num) in num_list.enumerated() {
        if index % 2 == 0 {
            even += num
        } else {
            odd += num
        }
    }
    
    return odd > even ? odd : even
}