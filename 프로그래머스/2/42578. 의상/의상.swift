import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict : [String: Int] = [:]
    
    for cloth in clothes {
        let key = cloth[1]
        if !dict.keys.contains(key) {
            dict[key] = 0
        }
        dict[key]? += 1
    }

    var count = 1
    for num in dict.values {
        count *= (num + 1)
    }
    
    return count - 1
}