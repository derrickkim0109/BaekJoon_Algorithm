import Foundation

func solution(_ rank:[Int], _ attendance:[Bool]) -> Int {
    var dic = Dictionary(uniqueKeysWithValues: zip(rank, attendance))
    let ranks = dic.filter { $0.value != false }.keys.sorted()
    let a = rank.firstIndex(of: ranks[0])!
    let b = rank.firstIndex(of: ranks[1])!
    let c = rank.firstIndex(of: ranks[2])!
    
    return 10000 * a + 100 * b + c
}