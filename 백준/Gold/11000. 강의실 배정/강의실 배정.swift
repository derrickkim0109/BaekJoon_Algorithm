public struct Heap<T> {
    private var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        // 최대 힙인지 최소 힙인지 기준을 잡는다.
        self.orderCriteria = sort
    }

    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }

    public var count: Int {
        return nodes.count
    }

    public func peek() -> T? {
        return nodes.first
    }

    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }

    public mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }

        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }

    public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }

        let lastIndex = nodes.count-1
        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }

        return nodes.removeLast()
    }

    // 변수를 직접 변경해야 하기 때문에 mutating 을 사용한다.
    private mutating func configureHeap(from array: [T]) {
        nodes = array

        /**
         * 힙 트리에서 n/2 - 1 은 하나 위 층위가 된다.
         * shiftDown을 하면서 자리를 잡을 것이기 때문에
         * 마지막 leaf 노드들은 할 필요가 없다.
         */
        for i in stride(from: nodes.count/2 - 1, through: 0, by: -1) {
            shiftDown(i)
        }
    }

    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }

    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }

    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }

    /**
     * shiftUp은 자신과 부모를 비교해 바꿔준다.
     */
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex] // 처음에 노드를 저장해두고 인덱스를 구한 후 바꿔준다.
        var parentIndex = self.parentIndex(ofIndex: index)

        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }

        nodes[childIndex] = child
    }

    /**
     * shiftDown은 left, right 자식 중 적합한 녀석이 있으면 바꾸면서 바닥까지 내려간다.
     */
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1

        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }

    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}
// 강의 정보를 저장할 구조체 정의
struct Lecture: Comparable {
    var start: Int
    var end: Int

    // 시작 시간을 기준으로 오름차순 정렬을 위한 구현
    static func < (lhs: Lecture, rhs: Lecture) -> Bool {
        return lhs.start < rhs.start || (lhs.start == rhs.start && lhs.end < rhs.end)
    }
}

// 강의 정보 입력 받기
let N = Int(readLine()!)!
var lectures = [Lecture]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    lectures.append(Lecture(start: input[0], end: input[1]))
}

// 강의 시작 시간 기준으로 정렬
lectures.sort()

// 최소 힙을 사용하여 강의실의 종료 시간 관리
var rooms = Heap<Int>(sort: <)

for lecture in lectures {
    // 현재 강의 시작 전에 끝나는 강의실이 있는지 확인
    if let earliestEnd = rooms.peek(), earliestEnd <= lecture.start {
        // 강의실 재사용 가능: 가장 빨리 끝나는 강의실 정보 업데이트
        _ = rooms.remove()
    }
    // 현재 강의를 강의실에 배정 (새 강의실 사용 또는 기존 강의실 재사용)
    rooms.insert(lecture.end)
}

// 필요한 최소 강의실 수 출력
print(rooms.count)
