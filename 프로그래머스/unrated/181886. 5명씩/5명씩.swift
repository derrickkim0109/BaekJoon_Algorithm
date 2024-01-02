import Foundation

func solution(_ names:[String]) -> [String] {
    var dic = [Int: [String]]()
    var groupSequence = 0

    for name in names {
        if dic[groupSequence] == nil {
            dic.updateValue([name], forKey: groupSequence)
        } else if dic[groupSequence] != nil
                    && dic[groupSequence]!.count <= 5 {
            dic[groupSequence]?.append(name)
        }

        if dic[groupSequence]?.count == 5 {
            groupSequence += 1
        }
    }
        
    return dic.sorted(by: { $0.key < $1.key }).map{ $0.value[0] }
}