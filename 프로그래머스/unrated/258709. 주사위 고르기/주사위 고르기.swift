import Foundation

func solution(_ dice: [[Int]]) -> [Int] {
    var resultArray = [Int]()
    var resultCount = 0

    let diceIndex = Array(0..<dice.count)
    let combinations = combination(diceIndex, dice.count / 2)

    for aArray in combinations {
        let aDice = aArray.map { dice[$0] }
        let bDice = diceIndex.filter { !aArray.contains($0) }.map { dice[$0] }

        var aDic: [Int: Int] = [:]
        var bDic: [Int: Int] = [:]

        rollDice([], aDice, &aDic)
        rollDice([], bDice, &bDic)

        var result = 0

        for (aSummary, aCount) in aDic {
            for (bSummary, bCount) in bDic {
                if aSummary > bSummary {
                    result += aCount * bCount
                }
            }
        }

        if result > resultCount {
            resultArray = aArray
            resultCount = result
        }
    }

    return resultArray.map { $0 + 1 }
}

func combination(_ array: [Int], _ n: Int) -> [[Int]] {
    if n == 1 {
        return array.map { [$0] }
    }

    var result = [[Int]]()

    for (index, num) in array.enumerated() {
        let rest = Array(array[(index+1)...])
        let combinations = combination(rest, n - 1)
        let attach = combinations.map { [num] + $0 }

        result += attach
    }

    return result
}

func rollDice(_ array: [Int], _ dice: [[Int]], _ dic: inout [Int: Int]) {
    if array.count == dice.count {
        let sum = array.reduce(0, +)
        return dic[sum, default: 0] += 1
    }

    for i in 0..<6 {
        var newArray = array
        newArray.append(dice[array.count][i])
        rollDice(newArray, dice, &dic)
    }
}