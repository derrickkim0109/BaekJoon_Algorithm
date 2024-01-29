import Foundation

func solution(_ numbers:String) -> Int64 {
    let array = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    var result = ""
    var currentNum = ""
    
    for str in numbers {
        currentNum += String(str) 
        
        if let idx = array.firstIndex(of: currentNum) {
            result += String(idx) 
            currentNum = "" 
        }
    }
    
    return Int64(result)!
}