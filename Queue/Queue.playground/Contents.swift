// 队列： 队列
// 先进先出 FIFO
// 其他实现方式 链表 环形缓冲区 堆  双端队列 优先队列等
import Foundation

public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    // O(1)
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    // O(n)
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    public func peek() -> T? {
        return array.first
    }
    public var front: T? {
        return array.first
    }
}

var queueOfNames = Queue(array: ["Carl", "Lisa", "Stephanie", "Jeff", "Wade"])
queueOfNames.enqueue("Mike")
print(queueOfNames.array)
queueOfNames.dequeue()
queueOfNames.front
queueOfNames.isEmpty

