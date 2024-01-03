import Foundation

func solution(_ arr:[Int]) -> Int {
    var array1: [Int] = arr
    var index = 0
    
    while true {
        let array2: [Int] = array1.map {
            if $0 >= 50 && $0 % 2 == 0 {
                return $0 / 2
            }
            if $0 < 50 && $0 % 2 == 1 {
                return ($0 * 2) + 1
            }
            return $0
        }
        
        if array2 == array1 {
            break
        }
        
        array1 = array2
        index += 1
    }
    
    return index
}