struct Heap<T> {
    var nodes = [T]()
    var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }

    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(array)
    }

    public var isEmpty: Bool {
        return nodes.isEmpty
    }

    public var count: Int {
        return nodes.count
    }

    public func peek() -> T? {
        return nodes.first
    }

    public func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    public func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }

    public func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
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
            shiftDown(from: 0, until: nodes.count - 1)
            return value
        }
    }
}

extension Heap {
    private mutating func configureHeap(_ array: [T]) {
        self.nodes = array

        for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
            shiftDown(from: i, until: count - 1)
        }
    }

    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        var childNode = nodes[childIndex]
        var parentIndex = self.parentIndex(of: index)
        var parentNode = nodes[parentIndex]

        while childIndex > 0, orderCriteria(childNode, parentNode) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }

        nodes[childIndex] = childNode
    }

    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = leftChildIndex(of: index)
        let rightChildIndex = rightChildIndex(of: index)
        var first = index

        if leftChildIndex < endIndex, orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }

        if rightChildIndex < endIndex, orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }

        if first == index {
            return
        }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
}

// 간선 정보와 비교 가능하도록 구조체 정의
struct EdgeData: Comparable {
    let cost: Int // 간선의 비용
    let node: Int // 도착 노드

    // 두 간선을 비용 기준으로 비교
    static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
        return lhs.cost < rhs.cost
    }
}

// 다익스트라 알고리즘 구현
func dijkstra(start: Int) -> [Int] {
    var distance = Array(repeating: 999999999, count: N+1) // 모든 노드까지의 최단 거리를 무한대로 초기화
    distance[start] = 0 // 시작 노드까지의 거리는 0

    var heap = Heap<EdgeData>(sort: <) // 우선순위 큐(최소 힙) 초기화
    heap.insert(EdgeData(cost: 0, node: start)) // 시작 노드를 큐에 삽입

    // 큐가 빌 때까지 반복
    while !heap.isEmpty {
        let current = heap.remove() // 우선순위 큐에서 가장 비용이 작은 노드를 추출
        let (currentNode, currentDistance) = (current!.node, current!.cost) // 현재 노드와 해당 노드까지의 거리

        // 현재 노드까지의 거리가 이미 저장된 거리보다 크면 무시
        if distance[currentNode] < currentDistance {
            continue
        }

        // 현재 노드와 인접한 모든 노드에 대해 반복
        for (nextNode, nextCost) in graph[currentNode] {
            let nextDistance = currentDistance + nextCost // 다음 노드까지의 거리 계산

            // 다음 노드까지의 거리가 현재 알려진 거리보다 작으면 갱신
            if nextDistance < distance[nextNode] {
                distance[nextNode] = nextDistance
                heap.insert(EdgeData(cost: nextDistance, node: nextNode)) // 갱신된 거리로 우선순위 큐에 삽입
            }
        }
    }
    return distance // 모든 노드까지의 최단 거리 반환
}

// 입력 처리
let NE = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,E) = (NE[0],NE[1]) // 노드 수와 간선 수

var graph = Array(repeating: [(Int,Int)](), count: N+1) // 그래프 초기화

// 간선 정보 입력
for _ in 0..<E {
    let abc = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,c) = (abc[0],abc[1],abc[2])
    graph[a].append((b,c)) // 양방향 그래프
    graph[b].append((a,c))
}

// 특정 노드들 입력
let v = readLine()!.split(separator: " ").map{Int(String($0))!}
let (v1,v2) = (v[0],v[1])

// 1번 노드에서 시작하여 v1, v2를 경유하는 두 가지 경로의 최단 거리 계산
let dist1 = dijkstra(start: 1)
let dist2 = dijkstra(start: v1)
let dist3 = dijkstra(start: v2)

// 두 경로 중 최소 거리 계산
let first = dist1[v1] + dist2[v2] + dist3[N]
let second = dist1[v2] + dist3[v1] + dist2[N]

// 두 경로 중 최소값 출력, 경로가 없는 경우 -1 출력
let ans = min(first,second)
print(ans >= 999999999 ? -1 : ans)
