import Foundation

func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    var firstIndex : Int = 0
    var lastIndex : Int = arr.count
    
    for index in 0..<query.count {
     if index % 2 == 0 {
            lastIndex = firstIndex + query[index]
        } else {
            firstIndex += query[index]
        }   
    }
    
    return arr[firstIndex...lastIndex].map { $0 }
}
