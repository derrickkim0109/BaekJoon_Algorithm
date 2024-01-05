import Foundation

func solution(_ binomial:String) -> Int {
    let formular = binomial.split(separator: " ").map { String($0) }
    
    let a = Int(formular[0])!
    let calculationOption = CalculationOption(rawValue: formular[1])
    let b = Int(formular[2])!
    
    switch calculationOption {
        case .addition: return a + b
        case .subtraction: return a - b
        case .multiplication: return a * b
        default: return 0
    }
}

enum CalculationOption: String {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
}