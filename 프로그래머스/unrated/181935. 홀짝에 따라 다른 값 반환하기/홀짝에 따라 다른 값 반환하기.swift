import Foundation

func solution(_ n:Int) -> Int {
    if n % 2 == 1 { 
        return (1...n).filter { $0 % 2 == 1 }.reduce(0, +)
    } else { 
        return (1...n).filter { $0 % 2 == 0 }.map { $0 * $0 }.reduce(0, +)
    }
}