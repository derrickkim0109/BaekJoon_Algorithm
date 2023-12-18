import Foundation

let s1 = readLine()!

let result = s1.map { $0.isUppercase ? String($0).lowercased() : String($0).uppercased() }.joined()
print(result)