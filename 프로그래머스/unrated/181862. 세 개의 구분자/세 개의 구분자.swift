import Foundation

func solution(_ myStr:String) -> [String] {
    var answer = [String]()
    var word = ""
    for str in myStr.map ({ String($0) }) {
        let type = SeparatorType(rawValue: str)
        
        switch type {
            case .a, .b, .c: 
                if !word.isEmpty {
                    answer.append(word)        
                }
            
                word = "" 
                continue
            
            default: 
                word += str
        }    
    }
    
    if !word.isEmpty {
        answer.append(word)
    } else {
        answer.append("EMPTY")
    }
    
    return answer
}

enum SeparatorType: String {
    case a, b, c
}