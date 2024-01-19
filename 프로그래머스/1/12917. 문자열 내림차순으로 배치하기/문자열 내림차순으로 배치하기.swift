func solution(_ s:String) -> String {
    return s.sorted(by: { $0 > $1 } ).reduce("") { String($0) + String($1) }
}