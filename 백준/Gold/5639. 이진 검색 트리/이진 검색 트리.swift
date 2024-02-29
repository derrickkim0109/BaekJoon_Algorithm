func findHigherIndex(start: Int, end: Int, compare: Int) -> Int {
    var higherIndex: Int = end

    for i in start ..< end {
        if treeList[i] > compare {
            higherIndex = i
            break
        }
    }
    
    return higherIndex
}

func postOrder(start: Int, end: Int) {
    if start >= end {
        return
    }
    
    let higherIndex: Int = findHigherIndex(start: start + 1, end: end, compare: treeList[start])
    
    postOrder(start: start + 1, end: higherIndex)
    postOrder(start: higherIndex, end: end)
    print(treeList[start])
}

var treeList: [Int] = []

while let input = readLine(), let n = Int(input) {
    treeList.append(n)
}

postOrder(start: 0, end: treeList.count)