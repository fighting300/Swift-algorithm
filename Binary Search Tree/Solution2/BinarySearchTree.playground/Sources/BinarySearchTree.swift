import Foundation

public enum BinarySearchTree<T: Comparable> {
    case empty
    indirect case node(BinarySearchTree, T, BinarySearchTree)
    
    public var count: Int {
        switch self {
        case let .node(left, _, right): return left.count + 1 + right.count
        case .empty: return 0
        }
    }
    
    public var height: Int {
        switch self {
        case .empty: return 0
        case let .node(left, _, right): return 1 + max(left.height, right.height)
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        switch self {
            case let .node(left, value, right):
                return  "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
            case .empty:
                return ""
        }
    }
}

extension BinarySearchTree {
    public mutating func nativeInsert(newValue: T) {
        guard case .node(var left, let value, var right) = self else {
            self = .node(.empty, newValue, .empty)
            return 
        }
        if newValue < value {
            left.nativeInsert(newValue: newValue)
        } else {
            right.nativeInsert(newValue: newValue)
        }
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinarySearchTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case let .node(left, value, right):
            if newValue < value {
                return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
            }
        }
    }
    public mutating func insertNative(newValue: T) {
        self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    public func insert(newValue: T) -> BinarySearchTree {
        switch self {
        case .empty:
            return .node(.empty, newValue, .empty)
        case .node(let left, let value, let right):
            if newValue < value {
                return .node(left.insert(newValue: newValue), value, right)
            } else {
                return .node(left, value, right.insert(newValue: newValue))
            }
        }
    }
    
    public func traverseInOrder(process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    
    public func traversePreOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    
    public func traversePostOrder( process: (T) -> ()) {
        switch self {
        case .empty:
            return
        case let .node(left, value, right):
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }

    public func search(searchValue: T) -> BinarySearchTree? {
        switch self {
        case .empty:
            return nil
        case let .node(left, value, right):
            if searchValue == value {
                return self
            }
            if searchValue < value {
                return left.search(searchValue: searchValue)
            } else {
                return right.search(searchValue: searchValue)
            }
        }
    }
}





