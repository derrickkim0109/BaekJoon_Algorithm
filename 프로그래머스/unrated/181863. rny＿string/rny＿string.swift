import Foundation

func solution(_ rny_string:String) -> String {
    var answer = ""
    
    for char in rny_string {
        if char == "m" {
            answer += "rn"
        } else {
            answer += "\(char)"
        }
    }
    
    return answer
}