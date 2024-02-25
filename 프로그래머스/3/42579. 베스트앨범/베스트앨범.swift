func solution(_ genres: [String], _ plays: [Int]) -> [Int] {
    var answer = [Int]()
    var dic1 = [String: [(Int, Int)]]()
    var dic2 = [String: Int]()

    for (i, (g, p)) in zip(genres, plays).enumerated() {
        if dic1[g] == nil {
            dic1.updateValue([(i, p)], forKey: g)
        } else {
            dic1[g]?.append((i, p))
        }

        if dic2[g] == nil {
            dic2.updateValue(p, forKey: g)
        } else {
            dic2[g]? += p
        }
    }

    for (k, v) in dic2.sorted(by: { $0.value > $1.value }) {
        for (i, p) in dic1[k]!.sorted(by: { $0.1 > $1.1 }).prefix(2) {
            answer.append(i)
        }
    }

    return answer
}
