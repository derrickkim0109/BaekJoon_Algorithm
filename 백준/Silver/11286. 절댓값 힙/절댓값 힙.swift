struct Heap<T> {
    private var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool 
    
    init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    var count: Int {
        return nodes.count
    }
    
    func peek() -> T? {
        return nodes.first
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
    
    mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(from: count - 1)
    }
    
    mutating func remove() -> T? {
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
        
        while childIndex > 0, orderCriteria(childNode, nodes[parentIndex]) {
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

let n = Int(readLine()!)!

var heap: Heap<Int> = Heap { a, b in
    if abs(a) < abs(b) {
        return true
    } else if abs(a) == abs(b) {
        return a < b
    } else {
        return false
    }
}

var result = ""

for _ in 0..<n {
    let value = Int(readLine()!)!
    if value != 0 {
        heap.insert(value)
    } else {
        if let v = heap.remove() {
            result += "\(v)\n"
        } else {
            result += "0\n"
        }
    }
}

print(result)
