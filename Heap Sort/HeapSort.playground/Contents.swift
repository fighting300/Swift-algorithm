//: Playground - noun: a place where people can play
// 快速排序算法： 堆排序  类似选择排序
// 拆分数据，然后合并拆分后的数据  非稳定排序
// 复杂度 O(nlog n)
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
