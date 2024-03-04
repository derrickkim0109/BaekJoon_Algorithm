let N = Int(readLine()!)!
var letters: [String : Int] = [:]

for _ in 0..<N{
    let word = readLine()!.map{ String($0) }
    var base = 1

    for letter in word.reversed(){
        letters[letter, default: 0] += 1 * base
        base *= 10
    }
}

var num = 9
var total = 0

for value in letters.values.sorted(by: >){
    total += num * value
    num -= 1
}
print(total)
