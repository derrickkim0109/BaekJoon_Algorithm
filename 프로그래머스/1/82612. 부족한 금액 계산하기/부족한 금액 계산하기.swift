import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer = 0
    
    for i in 1...count {
        answer += i * price
    }
    
    return Int64(answer - money) <= 0 ? 0 : Int64(answer - money)
}