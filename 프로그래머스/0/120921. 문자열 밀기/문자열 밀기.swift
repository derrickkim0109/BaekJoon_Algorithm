import Foundation

func solution(_ A:String, _ B:String) -> Int {
    return (0..<A.count).first(where: { i in
        let rotated = A.suffix(i) + A.prefix(A.count - i)
        return rotated == B
    }) ?? -1
}