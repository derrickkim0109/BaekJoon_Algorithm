import Foundation

func solution(_ n:Int, _ control:String) -> Int {
    let string = control.map { String($0) }
    var answer = n
    
    for char in string {
        let type = CharacterType(rawValue: char)
        
        switch type {
            case .w: answer += 1
            case .s: answer -= 1
            case .d: answer += 10
            case .a: answer -= 10
            case .none: break
        }
    }
    
    return answer
}

enum CharacterType: String {
    case w, s, d, a
}