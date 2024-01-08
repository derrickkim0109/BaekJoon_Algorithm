import Foundation

func solution(_ a:String, _ b:String) -> String {
    var a = a.map { String($0) }
    var b = b.map { String($0) }
    var temp = 0
    var result = ""
    
    while true {
        var sum = temp
        
        if !a.isEmpty {
            let oneNum = a.last ?? ""
            let number = Int(oneNum) ?? 0
            sum += number
            a.removeLast()
        }
        
        if !b.isEmpty {
            let oneNum = b.last ?? ""
            let number = Int(oneNum) ?? 0
            sum += number
            b.removeLast()
        }
        
        result = String(sum % 10) + result
        temp = sum / 10
        
        if a.isEmpty && b.isEmpty {
            break
        }
    }
    
    if temp != 0 {
        result = String(temp) + result
    }
    
    return result
}