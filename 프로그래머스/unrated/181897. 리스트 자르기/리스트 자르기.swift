import Foundation

func solution(_ n:Int, _ slicer:[Int], _ num_list:[Int]) -> [Int] {
    var answer = [Int]()
    let slicerType = SlicerType(rawValue: n) ?? .zeroToB
    
    let a = slicer[0]
    let b = slicer[1]
    let c = slicer[2]
    
    switch slicerType { 
        case .zeroToB:
            answer.append(contentsOf: num_list[0...b])
        case .aToLast:
            answer.append(contentsOf: num_list[a...num_list.count - 1])
        case .aToB:
            answer.append(contentsOf: num_list[a...b])
        case .aToBByC:
            for i in stride(from: a, to: b + 1, by: c) {
                answer.append(num_list[i])   
            }
    }
    
    return answer
}

enum SlicerType: Int {
    case zeroToB = 1
    case aToLast = 2
    case aToB = 3
    case aToBByC = 4
}