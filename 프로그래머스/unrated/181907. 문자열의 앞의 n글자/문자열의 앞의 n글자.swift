import Foundation

func solution(_ my_string:String, _ n:Int) -> String {
    let startIndex = my_string.index(my_string.startIndex, offsetBy: 0) 
    let endIndex = my_string.index(my_string.startIndex, offsetBy: n)
    
    let answer = my_string[startIndex..<endIndex]
    
    return String(answer)
}