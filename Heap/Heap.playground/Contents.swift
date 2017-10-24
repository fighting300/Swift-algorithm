//: Playground - noun: a place where people can play
// 堆
import UIKit

public struct Heap<T> {
    var elements = [T]()
    
    fileprivate var isOrderedBefore: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) {
        self.isOrderedBefore = sort
    }
    
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.isOrderedBefore = sort
        
    }
    // 复杂度 O(n)
    fileprivate mutating func buildHeap(fromArray array: [T]) {
        elements = array
        for i in stride(from: (elements.count/2 - 1), through: 0, by: -1) {
            shiftDown(i, heapSize: elements.count)
        }
    }
    
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
    
    @inline(__always) func rightChildOfIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
    
    public func peek() -> T? {
        return elements.first
    }
    
    mutating func shiftDown() {
        shiftDown(0, heapSize: elements.count)
    }
    
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
            if first = parentIndex { return }
            
            elements.swapAt(parentIndex, first)
            parentIndex = first
        }
    }
}
