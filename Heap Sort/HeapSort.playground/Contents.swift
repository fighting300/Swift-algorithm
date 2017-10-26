// 快速排序算法： 堆排序  不稳定排序
// 从堆顶把根卸出来放在有序区之前，再恢复堆
// 时间复杂度 O(nlog n) 空间复杂度 O(1)
import Foundation

extension Heap {
    public mutating func sort() -> [T] {
        for i in stride(from: (elements.count - 1), through: 1, by: -1) {
            elements.swapAt(0, i)
            shiftDown(0, heapSize: i)
        }
        return elements
    }
}

var h1 = Heap(array: [5, 13, 2, 25, 7, 17, 20, 8, 4], sort: >)
h1.elements
let a1 = h1.sort()


public func heapsort<T>(_ a: [T], _ sort: @escaping (T, T) -> Bool) -> [T] {
    let reverseOrder = { i1, i2 in sort(i2, i1)}
    var h = Heap(array: a, sort: reverseOrder)
    return h.sort()
}
