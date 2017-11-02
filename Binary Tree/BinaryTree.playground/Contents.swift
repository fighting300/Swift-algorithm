// 树：二叉树
import Foundation

public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
}

extension BinaryTree: CustomStringConvertible {
    public var description: String {
        switch self {
        case let .node(left, value, right):
            return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
        case .empty:
            return ""
        }
    }
}

extension BinaryTree {
    public func traverseInOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
            process(value)
        }
    }
}

extension BinaryTree {
    func invert() -> BinaryTree {
        if case let .node(left, value, right) = self {
            return .node(right.invert(), value ,right.invert())
        } else {
            return .empty
        }
    }
}

// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let aMinus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", aMinus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let tree = BinaryTree.node(timesLeft, "+", timesRight)

print(tree)
tree.count  // 12

tree.traverseInOrder { s in print(s) }
tree.traversePreOrder { s in print(s) }
tree.traversePostOrder { s in print(s) }

