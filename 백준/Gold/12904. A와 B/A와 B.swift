import Foundation

let S = readLine()!
var T = readLine()!

var flag = false
while true {
    if T.count == S.count {
        if S == T {
            flag = true
        }
        break
    }
    
    if T.last! == "A" {
        T.removeLast()
    } else {
        T.removeLast()
        T = T.reversed().map{String($0)}.joined()
    }  
}

print(flag ? "1" : "0")