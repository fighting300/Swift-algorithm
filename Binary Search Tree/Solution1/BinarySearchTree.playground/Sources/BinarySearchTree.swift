public class BinarySearchTree<T: Comparable> {
    fileprivate(set) var value: T
    fileprivate(set) var left: BinarySearchTree?
    fileprivate(set) var right: BinarySearchTree?
    fileprivate(set) var parent: BinarySearchTree?
    
    public init(value: T) {
        self.value = value
    }
    
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }

    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
}


extension BinarySearchTree {
    // O(h) where h is the height of the tree.
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    // O(h) where h is the height of the tree.
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            return nil
        }
        replacement?.remove()
        
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentTo(node: replacement)
        
        parent = nil
        left = nil
        right = nil
        return replacement
    }
    
    private func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    // O(h) where h is the height of the tree.
    public func search(value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
    
    /*
    public func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        } else {
            return self
        }
    }
     */
    
    public func contains(value: T) -> Bool {
        return search(value: value) != nil
    }
    
    public func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    public func depth() -> Int {
        var node = self
        var edges = 0
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
    
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    public func predecessor() -> BinarySearchTree<T>? {
        if let left = left {
            return left.maximum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value < value { return parent }
                node = parent
            }
            return nil
        }
    }
    
    public func successor() -> BinarySearchTree<T>? {
        if let right = right {
            return right.minimum()
        } else {
            var node = self
            while let parent = node.parent {
                if parent.value > value { return parent }
                node = parent
            }
            return nil
        }
    }

}

extension BinarySearchTree {
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
    
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
    
    public func toArray() -> [T] {
        return map { $0 }
    }

}

