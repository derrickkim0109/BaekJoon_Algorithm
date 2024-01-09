import Foundation

func solution(_ order:[String]) -> Int {
    var result = 0
    
    for o in order {
        if o.contains("americano") || o == "anything" {
            result += 4500
        } else if o.contains("cafelatte") {
            result += 5000
        }
    }
    
    return result
}
