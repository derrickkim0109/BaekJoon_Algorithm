import Foundation

func solution(_ friends:[String], _ gifts:[String]) -> Int {
        guard !(friends.count < 2 || friends.count > 50)
    && !(gifts.count < 0 || gifts.count > 10000) else {
        return 0
    }

    var dics: [String: [String: Int]] = [:]
    var giftInfo: [String: [Int]] = [:] // 준 선물, 받은 선물, 선물 지수

    for (index, name) in friends.enumerated() {
        dics[name] = [:]
        giftInfo[name] = []

        for j in 0..<friends.count {
            let other = friends[j]

            if other != name {
                dics[name]![other] = 0
            }
        }
    }

    for gift in gifts {
        let info = gift.split(separator: " ").map { String($0) }
        let from = info[0]
        let to = info[1]

        dics[from]![to]! += 1
    }

    for (fromName, info) in dics {
        var toCount = 0
        var receivedCount = 0
        var giftPoint = 0

        // 준 선물, 받은 선물
        for to in info {
            let toName = to.key
            let A = dics[fromName]![toName]!
            let B = dics[toName]![fromName]!

            toCount += to.value
            receivedCount += B
        }
        giftPoint = toCount - receivedCount

        giftInfo[fromName]!.append(contentsOf: [toCount, receivedCount, giftPoint])
    }

    var nextGifts: [Int] = []

    for (fromName, info) in dics {
        var fromGiftPoint = giftInfo[fromName]!.last!
        var point = 0

        // 선물 지수
        for to in info {
            let toName = to.key
            let A = dics[fromName]![toName]!
            let B = dics[toName]![fromName]!
            var BGiftPoint = giftInfo[toName]!.last!

            // 기록이 있을 때, 두 사람 사이에 더 많은 선물을 준 사람이 하나 더 받음
            if (A > B) {
                point += 1
            }

            // 기록이 없거나, 주고 받은 개수가 같을 때,
            if ((A == 0 && B == 0) || (A == B)) && fromGiftPoint > BGiftPoint {
                point += 1
            }
        }

        nextGifts.append(point)
    }

    var max = nextGifts.map { $0 }.max()!
    let nextGiftCount = nextGifts.map { $0 }.filter{ $0 != max }.count

    if nextGiftCount == 0 {
        return 0
    }

    return max
}