//: Playground - noun: a place where people can play
// 基本排序算法： 选择排序
// 选择未排序数据中最大/小的数放到已排序的部分

// 复杂度 O(n^2) 寻找最小数会重复运行，比Bundle sort性能好，但是不如Insertion Sort，HeapSort使用了类似的方法，但是性能为O(nlog n)
func selectionSort<T: Comparable>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    var a = array
    for x in 0 ..< a.count - 1 {
        var lowest = x
        for y in x + 1 ..< a.count {
            if isOrderedBefore(a[y], a[lowest]) {
                lowest = y
            }
         }
        
        if x != lowest {
            a.swapAt(x, lowest)
        }
    }
    return a
}

let list = [ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ]
selectionSort(list, >)


func selectionSortSwap(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }  // 1
    
    var a = array
    for x in 0 ..< a.count - 1 {
        var lowest = x
        for y in x + 1 ..< a.count {
            if a[y] < a[lowest] {
                lowest = y
            }
        }
        if x != lowest {
            a.swapAt(x, lowest)
        }
    }
    return a
}

selectionSortSwap(list)
