final class TreeNode<T> {
    var value: T
    var left: TreeNode?
    var right: TreeNode?

    init(value: T) {
        self.value = value
    }
}

var tree = [String : TreeNode<String>]()

// 예제 입력 데이터
let n = Int(readLine()!)!

for _ in 0..<n {
    let v = readLine()!.split(separator: " ").map { String($0) }
    let rootValue = v[0]
    let leftValue = v[1]
    let rightValue = v[2]

    if tree[rootValue] == nil {
        tree[rootValue] = TreeNode(value: rootValue)
    }
    let node = tree[rootValue]!

    if leftValue != "." {
        let leftNode = TreeNode(value: leftValue)
        node.left = leftNode
        tree[leftValue] = leftNode
    }

    if rightValue != "." {
        let rightNode = TreeNode(value: rightValue)
        node.right = rightNode
        tree[rightValue] = rightNode
    }
}

// 전위 순회
func preOrderTraversal(_ node: TreeNode<String>?) {
    guard let node = node else {
        return
    }
    print(node.value, terminator: "")
    preOrderTraversal(node.left)
    preOrderTraversal(node.right)
}

// 중위 순회
func inOrderTraversal(_ node: TreeNode<String>?) {
    guard let node = node else {
        return
    }
    inOrderTraversal(node.left)
    print(node.value, terminator: "")
    inOrderTraversal(node.right)
}

// 후위 순회
func postOrderTraversal(_ node: TreeNode<String>?) {
    guard let node = node else {
        return
    }
    postOrderTraversal(node.left)
    postOrderTraversal(node.right)
    print(node.value, terminator: "")
}

let root = tree["A"]

preOrderTraversal(root)
print()
inOrderTraversal(root)
print()
postOrderTraversal(root)
print()
