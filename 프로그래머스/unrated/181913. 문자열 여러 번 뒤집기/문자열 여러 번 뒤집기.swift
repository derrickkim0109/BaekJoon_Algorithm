import Foundation

func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    var string = my_string.map { String($0) }    
    
    var temp = ""
    
    for query in queries {
        let s = query[0]
        let e = query[1]
        
        for i in s...(s + e) / 2 {
            temp = string[i]
            string[i] = string[s + e - i]
            string[s + e - i] = temp
        }
    }
    
    return string.joined()
}