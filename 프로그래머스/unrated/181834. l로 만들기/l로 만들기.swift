import Foundation

func solution(_ myString:String) -> String {
    let result = myString.map { char in
         if char <= "l" {
             return "l"
         } 
        return String(char)
     }.joined()
    
    return result
}