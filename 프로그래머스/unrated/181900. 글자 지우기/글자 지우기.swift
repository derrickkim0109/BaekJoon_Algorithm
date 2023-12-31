import Foundation

func solution(_ my_string:String, _ indices:[Int]) -> String {
    var dic: [Int: String] = Dictionary(uniqueKeysWithValues:
        my_string.enumerated().map { (index, char) in
            return (index, String(char))
        }
    )
    
    for index in indices {
        dic.removeValue(forKey: index)
    }
    
    let sortedDictionary = dic.sorted { $0.key < $1.key }
    let combinedString = sortedDictionary.map { $0.value }.joined()
    
    return combinedString
}