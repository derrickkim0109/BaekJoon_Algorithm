import Foundation

func solution(_ balls:Int, _ share:Int) -> Int {
    if (balls == share){
        return 1
    }
    
    let result = factorial(balls) / factorial(balls - share) / factorial(share)
    return Int(NSDecimalNumber(decimal: result))
}

func factorial(_ n: Int) -> Decimal{
    var number: Decimal = Decimal(1)
    
    for i in 1...n {
        number *= Decimal(i)
    }
    
    return number
}
