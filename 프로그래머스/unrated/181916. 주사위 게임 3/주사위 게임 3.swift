import Foundation

func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    let numbers = [a, b, c, d]
    let dic: [Int: Int] = Dictionary(grouping: numbers, by: { $0 }).mapValues { $0.count }
    
    if Set(numbers).count == 4 { return numbers.min()! } // 모두 다르면
    else if Set(numbers).count == 1 { return 1111 * a } // 4개 모두 같은 숫자
    else if Set(numbers).count == 2 {
        if dic.values.contains(3) {
            let p = dic.first { $0.value == 3 }!.key
            let q = numbers.first { $0 != p }!
            let calculatedNumber = pow(Decimal(10 * p + q), 2)
            
            return Int(calculatedNumber._mantissa.0)
        } else {
            let p = dic.keys.first!
            let q = dic.keys.dropFirst().first!
            return (p + q) * abs(p - q)
        }
    } else {
        // 2개가 서로 다른 숫자 ?? -> 총 3개
        let p = dic.first { $0.value == 2 }!.key
        let q = numbers.first { $0 != p }!
        let r = numbers.first { $0 != p && $0 != q }!
        
        return q * r
    }
}