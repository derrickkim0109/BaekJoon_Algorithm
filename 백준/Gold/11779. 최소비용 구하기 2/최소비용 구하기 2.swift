public struct Heap<T> {
    private var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
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
        shiftUp(from: count - 1)
    }

    // For max-heap
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

        while childIndex > 0,
              orderCriteria(childNode, nodes[parentIndex]) {
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

        if leftChildIndex < endIndex,
           orderCriteria(nodes[leftChildIndex], nodes[first]) {
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

struct City: Comparable {
    var city: Int
    var cost: Int

    static func < (lhs: City, rhs: City) -> Bool {
        return lhs.cost < rhs.cost
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var cities: [Int: [City]] = [:]

for i in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let startCity = info[0]
    let destinationCity = info[1]
    let cost = info[2]

    cities[startCity, default: []].append(City(city: destinationCity, cost: cost))
}

let destinationInfo = readLine()!.split(separator: " ").map { Int($0)! }
let startCity = destinationInfo[0]
let destinationCity = destinationInfo[1]

var visited = Array(repeating: false, count: n + 1)
var costArray = Array(repeating: Int.max, count: n + 1)
var cityRoute = Array(repeating: -1, count: n + 1)

dijkstra(start: startCity, destination: destinationCity)

func dijkstra(start: Int, destination: Int) {
    var heap = Heap<City>(sort: <)
    costArray[start] = 0
    cityRoute[start] = 0

    heap.insert(City(city: start, cost: 0))

    while let current = heap.remove() {
        let currentCity = current.city

        if visited[currentCity] {
            continue
        }

        visited[currentCity] = true

        for next in cities[currentCity] ?? [] {
            let nextCity = next.city
            let nextCost = next.cost

            if costArray[currentCity] + nextCost < costArray[nextCity] {
                costArray[nextCity] = costArray[currentCity] + nextCost
                cityRoute[nextCity] = currentCity
                heap.insert(City(city: nextCity, cost: costArray[nextCity]))
            }
        }
    }
}

print(costArray[destinationCity])

var route = destinationCity
var answer: [Int] = []

while cityRoute[route] != -1 {
    answer.append(route)
    route = cityRoute[route]
}

print(answer.count)
print(answer.reversed().map { String($0) }.joined(separator: " "))
