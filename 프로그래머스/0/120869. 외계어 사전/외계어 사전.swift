import Foundation

func solution(_ spell:[String], _ dic:[String]) -> Int {
    var answer = false
    
    for word in dic {
        var isContained = true
        
        for i in 0..<spell.count {
            if !word.contains(spell[i]) {
                isContained = false
            }
        }
        
        if isContained == true {
            answer = true
        }
    }
    
    return answer == true ? 1 : 2
}