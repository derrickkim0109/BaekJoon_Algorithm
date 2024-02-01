import Foundation

func solution(_ s:String) -> Int {
    let array = s.map { $0 }
    var minValue = Int.max

    if array.count == 1 {
        return 1
    }

    for unit in 1...array.count / 2 {
        var word = ""
        var num = 1
        var target = array[0..<unit]

        for i in stride(from: unit, to: array.count, by: unit) {
            var index = i + unit
            if i + unit > array.count - 1 {
                index = array.endIndex
            }

            if target == array[i..<index] {
                num += 1
            } else {
                if num >= 2 {
                    word += "\(num)" + target
                } else {
                    word += target
                }

                target = array[i..<index]
                num = 1
            }
        }

        if num >= 2 {
            word += "\(num)" + target
        } else {
            word += target
        }

        minValue = min(minValue, word.count)
    }

    return minValue
}