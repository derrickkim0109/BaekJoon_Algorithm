func solution(_ arr:[Int]) -> [Int] {
    var answer = arr
    let min = answer.min()!
    let index = answer.firstIndex(of: min)!
    answer.remove(at: index)
    return answer.isEmpty == true ? [-1] : answer
}