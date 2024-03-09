public struct Heap<T> {
    private var nodes = [T]()
    private var sort: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    public var count: Int {
        return nodes.count
    }
    
    public var peek: T? {
        return nodes.first
    }
    
    public func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    public func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    public func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(from: count - 1)
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
            shiftDown(from: 0, until: count)
            return value
        }
    }
}

extension Heap {
    private mutating func shiftUp(from index: Int) {
        var childIndex = index
        let childNode = nodes[childIndex]
        var parentIndex = self.parentIndex(of: childIndex)
        
        while childIndex > 0, sort(childNode, nodes[parentIndex]) {
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
        
        if leftChildIndex < endIndex, sort(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }

        if rightChildIndex < endIndex, sort(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        
        if first == index {
            return 
        }
        
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
}

struct City: Comparable {
    let city: Int
    let cost: Int

    // 비용에 따른 비교 구현
    static func < (lhs: City, rhs: City) -> Bool {
        return lhs.cost < rhs.cost
    }
}

// 입력 처리
let n = Int(readLine()!)! // 도시의 개수
let m = Int(readLine()!)! // 버스의 개수
var city: [Int: [City]] = [:] // 도시 연결 정보 저장 딕셔너리

// 버스 정보 입력 및 도시 딕셔너리 구성
for _ in 0..<m {
    let v = readLine()!.split(separator: " ").map { Int($0)! }
    let start = v[0], destination = v[1], cost = v[2]
    city[start, default: []].append(City(city: destination, cost: cost))
}

// 시작점과 도착점 입력
var input = readLine()!.split(separator: " ").map { Int($0)! }
let startCity = input[0], destinationCity = input[1]

// 다익스트라 알고리즘 실행을 위한 초기 설정
var costArray = Array(repeating: Int.max, count: n + 1) // 각 도시까지의 최소 비용 저장 배열
var visited = Array(repeating: false, count: n + 1) // 방문 여부 표시 배열
dijkstra(start: startCity, destination: destinationCity) // 다익스트라 알고리즘 실행

// 최소 비용 출력
print(costArray[destinationCity])

// 다익스트라 알고리즘 구현 함수
func dijkstra(start: Int, destination: Int) {
    var queue = Heap<City>(sort: <) // 최소 힙을 이용한 우선순위 큐 구성
    costArray[start] = 0 // 시작 도시까지의 비용은 0
    queue.insert(City(city: start, cost: 0)) // 시작 도시 큐에 추가

    while let currentCity = queue.remove() {
        let current = currentCity.city

        if visited[current] { continue } // 이미 방문한 도시는 건너뜀
        visited[current] = true // 방문 표시

        // 현재 도시에서 이동 가능한 모든 도시를 순회
        for next in city[current] ?? [] {
            let nextCity = next.city
            if visited[nextCity] { continue } // 이미 방문한 도시는 건너뜀

            // 새로운 경로가 기존 경로보다 비용이 적은 경우 업데이트
            if costArray[nextCity] > costArray[current] + next.cost {
                costArray[nextCity] = costArray[current] + next.cost
                queue.insert(City(city: nextCity, cost: costArray[nextCity])) // 업데이트된 경로 큐에 추가
            }
        }
    }
}
