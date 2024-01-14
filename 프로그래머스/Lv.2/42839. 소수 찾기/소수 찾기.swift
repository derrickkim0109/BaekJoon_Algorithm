import Foundation

func solution(_ numbers:String) -> Int {
    let nums = numbers.map { String($0) }
    var visited = [Bool]()
    var numberSet = Set<Int>()
    
    func permutation(_ numberArray: [String], count: Int, rCount: Int) {
        if count == rCount {
            numberSet.insert(Int(numberArray.joined())!)
            return 
        }
        
        for (index, num) in nums.enumerated() {
            if visited[index] == true {
                continue
            }
            
            var newNumberArray = numberArray
            newNumberArray.append(num)
            
            visited[index] = true
            
            permutation(newNumberArray, count: count + 1, rCount: rCount)
            visited[index] = false
        }
    }
    
    for i in 1...nums.count {
        visited = Array(repeating: false, count: nums.count) 
        permutation([], count: 0, rCount: i)
    }
    
    return numberSet.filter { checkPrime(of: $0) }.count
}

func checkPrime(of num: Int) -> Bool {
    if num < 4 {
        return num <= 1 ? false : true
    } else {
        var isPrime = true
        var i = 2
        
        while i * i <= num {
            if num % i == 0 {
                isPrime = false
                break
            }
            i += 1
        }
        
        return isPrime
    }
}
