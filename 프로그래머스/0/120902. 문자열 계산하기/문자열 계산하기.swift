import Foundation

func solution(_ my_string:String) -> Int {
    let strs = my_string.split(separator: " ")
    var answer = Int(strs[0])!
    
    for i in strs.enumerated() {
        if i.element == "+"  {
            answer += Int(strs[i.offset + 1])!
        } else if i.element == "-"  {
            answer -= Int(strs[i.offset + 1])!
        }     
    }
    
    return answer
}