import Foundation

func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var result = [String]()
    let n = cards1.count
    let m = cards2.count
    var card1Index = 0
    var card2Index = 0
    
    for char in goal {
        if card1Index < n 
        && char == cards1[card1Index] {
            result.append(cards1[card1Index])
            card1Index += 1
        }
        
        if card2Index < m
        && char == cards2[card2Index] {
            result.append(cards2[card2Index])
            card2Index += 1
        }
    }
    
    return result == goal ? "Yes" : "No"
}