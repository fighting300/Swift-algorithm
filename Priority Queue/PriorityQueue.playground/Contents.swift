//: Playground - noun: a place where people can play
// 队列Queues： 优先队列 一个保持最重要的元素总是在最前面的队列
import Foundation
// 复杂度 O(lg n)
public struct PriorityQueue<T> {
    fileprivate var heap: Heap<T>
    
    public init(sort: @escaping (T, T) -> Bool) {
        heap = Heap(sort: sort)
    }
    
    public var isEmpty: Bool {
        return heap.isEmpty
    }
    
    public var count: Int {
        return heap.count
    }
    
    public func peek() -> T? {
        return heap.peek()
    }
    
    public mutating func enqueue(_ element: T) {
        heap.insert(element)
    }
    
    public mutating func dequeue() -> T? {
        return heap.remove()
    }
    
    public mutating func changePriority(index i: Int, value: T) {
        return heap.replace(index: i, value: value)
    }
}

extension PriorityQueue where T: Equatable {
    public func index(of element: T) -> Int? {
        return heap.index(of: element)
    }
}

struct Message {
    let text: String
    let priority: Int
}

func < (m1: Message, m2: Message) -> Bool {
    return m1.priority < m2.priority
}

var queue = PriorityQueue<Message>(sort: <)

queue.enqueue(Message(text: "hello", priority: 100))
queue.enqueue(Message(text: "world", priority: 200))

queue.peek()!.priority

let result2 = queue.dequeue()
print(result2)

