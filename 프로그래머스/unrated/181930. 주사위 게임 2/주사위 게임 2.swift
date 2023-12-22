import Foundation

func solution(_ a:Int, _ b:Int, _ c:Int) -> Int {    
    if a != b && b != c && a != c {
        return a + b + c    
    } else if a == b && a == c {
        let plus = a + b + c
        let twoSquare = a*a + b*b + c*c
        let threeSquare = a*a*a + b*b*b + c*c*c
        return plus * twoSquare * threeSquare
    } else {
        return (a + b + c) * (a * a + b * b + c * c )
    }
}