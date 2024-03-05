public struct Heap<T> {
    private var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }

    public var count: Int {
        return nodes.count
    }

    public var peek: T? {
        return nodes.first
    }

    public var isEmpty: Bool {
        return nodes.isEmpty
    }

    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }

    public mutating func remove() -> T? {
        guard !isEmpty else {
            return nil
        }

        if count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }

    public mutating func remove(at index: Int) -> T? {
        guard index < count else {
            return nil
        }

        let lastIndex = count - 1

        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }

        return nodes.removeLast()
    }

    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func leftChildIndex(of index: Int) -> Int {
        return 2*index + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        return 2*index + 2
    }

    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let childNode = nodes[childIndex]
        var parentIndex = self.parentIndex(of: index)

        while childIndex > 0 && orderCriteria(childNode, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }

        nodes[childIndex] = childNode
    }

    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(of: index)
        let rightChildIndex = self.rightChildIndex(of: index)
        var first = index

        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }

        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }

        if first == index { 
            return
        }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }

    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: count)
    }
}

let n = Int(readLine()!)!
var heap = Heap<Int>(sort: >)

for _ in 0..<n {
    // 연산에 대한 정보 x를 입력받습니다.
    let x = Int(readLine()!)!
    if x == 0 {
        // x가 0이면 배열에서 가장 큰 값을 출력하고 그 값을 배열에서 제거합니다.
        // 배열이 비어 있으면 0을 출력합니다.
        print(heap.remove() ?? 0)
    } else {
        // x가 자연수라면 배열에 x를 넣습니다.
        heap.insert(x)
    }
}