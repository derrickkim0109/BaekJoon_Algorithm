func solution(_ s:String) -> String {
    let middle = s.count / 2
    let array = s.map { String($0) }
    return array.count % 2 == 0 ? String(array[middle-1...middle].joined()) : array[middle]
} 