let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int($0)! }
var list = [Int]()
var answer = 1

list.append(array[0])

array.forEach { i in
    if i > list.last! {
        list.append(i)
        answer += 1
    } else {
        let position = binarySearch(list, i)
        list[position] = i
    }
}

print(answer)

func binarySearch(_ arr: [Int], _ target: Int) -> Int {
    var start: Int = 0
    var end: Int = arr.count

    var mid: Int = arr.count

    while end - start > 0 {
        mid = (start + end) / 2

        if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    return end
}
