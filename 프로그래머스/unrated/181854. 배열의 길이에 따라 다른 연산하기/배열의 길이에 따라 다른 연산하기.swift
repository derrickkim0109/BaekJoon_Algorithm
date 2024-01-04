import Foundation

func solution(_ arr:[Int], _ n:Int) -> [Int] {
    var answer = [Int]()
    
    if arr.count % 2 != 0 {
        answer = arr.enumerated().map { (index, num) in
            if index % 2 == 0 {
                return num + n 
            } else {
                return num
            }
        }    
    } else {
        answer = arr.enumerated().map { (index, num) in
            if index % 2 != 0 {
                return num + n 
            } else {
                return num
            }
        }    
    }
    
    return answer
}