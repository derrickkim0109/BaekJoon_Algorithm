func solution(_ n:Int) -> String {
    var answer = ""
    
    while answer.count != n {
        answer += answer.count % 2 == 0 ? "수" : "박"
    }
    
    return answer
}