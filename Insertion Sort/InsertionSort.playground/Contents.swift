//: Playground - noun: a place where people can play
// 基本排序算法： 插入排序
// 取未排序数组中的每一个数据与已排序的比较，并选择合适的位置插入

// 复杂度 O(n^2) 适用于不是很大的数据
// 相比较而言 QuickSort & MergeSort O(nlog n) 更适用于大量数据
func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }

    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y - 1]) {
            // 不做swap，只做比较移位，会更快
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}


let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26]
insertionSort(list, <)

// swift 默认方法
list.sorted()

/*
 let objects = [ obj1, obj2, obj3, ... ]
 insertionSort(objects) { $0.priority < $1.priority }
 */


// 示例
func insertionSortSwap(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0 && a[y] < a[y - 1] {
            a.swapAt(y - 1, y)
            y -= 1
        }
    }
    return a
}

insertionSortSwap(list)


