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
    
    mutating func shiftDown() {
        shiftDown(0, heapSize: elements.count)
    }
    
    mutating func shiftDown(_ index: Int, heapSize: Int) {
        
    }
}
