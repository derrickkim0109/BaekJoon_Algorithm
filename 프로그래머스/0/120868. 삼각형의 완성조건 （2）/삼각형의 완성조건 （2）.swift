import Foundation

func solution(_ sides:[Int]) -> Int {
    let long = max(sides[0],sides[1])
    let short = min(sides[0],sides[1])
    let startNum = long - short + 1
    let endNum = long + short - 1
    
    return (startNum...endNum).count
}