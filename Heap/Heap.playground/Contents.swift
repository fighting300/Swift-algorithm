//: Playground - noun: a place where people can play
import Foundation
// 树: 堆 父节点大于或小于子节点 shiftUp/Down
public struct Heap<T> {
    var elements = [T]()
    
    fileprivate var isOrderedBefore: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.isOrderedBefore = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.isOrderedBefore = sort
        buildHeap(fromArray: array)
    }
    // 复杂度 O(n)
    fileprivate mutating func buildHeap(fromArray array: [T]) {
        elements = array
        for i in stride(from: (elements.count/2 - 1), through: 0, by: -1) {
            shiftDown(i, heapSize: elements.count)
        }
    }
    /* // 复杂度 O(n log n)
    private mutating func privateBuildHeap(array: [T]) {
        elements.reserveCapacity(array.count)
        for value in array {
            insert(value)
        }
    }
    */
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    @inline(__always) func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    
    @inline(__always) func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    
    @inline(__always) func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    // O(1)
    public func peek() -> T? {
        return elements.first
    }
    // O(log n)
    public mutating func insert(_ value: T) {
        elements.append(value)
        shiftUp(elements.count - 1)
    }
    
    public mutating func inset<S: Sequence>(_ sequence: S) where S.Iterator.Element == T {
        for value in sequence {
            insert(value)
        }
    }
    
    public mutating func replace(index i: Int, value: T) {
        guard i < elements.count else { return }
        
        assert(isOrderedBefore(value, elements[i]))
        elements[i] = value
        shiftUp(i)
    }
    
    // O(log n)
    @discardableResult public mutating func remove() -> T? {
        if elements.isEmpty {
            return nil
        } else if elements.count == 1 {
            return elements.removeLast()
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            shiftDown()
            return value
        }
    }
    
    // O(log n)
    public mutating func removeAt(_ index: Int) -> T? {
        guard index < elements.count else { return nil }
        let size = elements.count - 1
        if index != size {
            elements.swapAt(index, size)
            shiftDown(index, heapSize: size)
            shiftUp(index)
        }
        return elements.removeLast()
    }
    // 遍历parent
    mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
        
        while childIndex > 0 && isOrderedBefore(child, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        
        elements[childIndex] = child
    }
    
    mutating func shiftDown() {
        shiftDown(0, heapSize: elements.count)
    }
    // 遍历children
    mutating func shiftDown(_ index: Int, heapSize: Int) {
        var parentIndex = index
        while true {
            let leftChildIndex = self.leftChildIndex(ofIndex: parentIndex)
            let rightChildIndex = leftChildIndex + 1
            
            var first = parentIndex
            if leftChildIndex < heapSize && isOrderedBefore(elements[leftChildIndex], elements[first]) {
                first = leftChildIndex
            }
            if rightChildIndex < heapSize && isOrderedBefore(elements[rightChildIndex], elements[first]) {
                first = rightChildIndex
            }
            if first == parentIndex { return }
            
            elements.swapAt(parentIndex, first)
            parentIndex = first
            print(index, parentIndex, elements)
        }
        
    }
}

extension Heap where T: Equatable {
    // O(n)
    public func index(of element: T) -> Int? {
        return index(of: element, 0)
    }
    
    fileprivate func index(of element: T, _ i: Int) -> Int? {
        if i >= count { return nil }
        if isOrderedBefore(element, elements[i]) { return nil }
        if element == elements[i] { return i }
        if let j =  index(of: element, self.leftChildIndex(ofIndex: i)) { return j }
        if let j =  index(of: element, self.rightChildIndex(ofIndex: i)) { return j }
        return nil
    }
}

var h1 = Heap(array: [4, 1, 3, 2, 16, 9, 10, 14, 8, 7], sort: >)
h1.elements
h1.peek()
h1.remove()

