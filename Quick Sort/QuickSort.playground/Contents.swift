//: Playground - noun: a place where people can play
// 快速排序算法： 快速排序 非稳定排序算法
// 取原数据支点(中间/最后/开头)，比对每个元素按大小分别放在其左右
// 复杂度 O(n^2) 最快为O(nlog n)
import Foundation

// 分治 filter不高效
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    return quicksort(less) + equal + quicksort(greater)
}

let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
quicksort(list)

public func random(min: Int, max: Int) -> Int {
    assert(min < max)
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

// 分治 lomuto
func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        //print(a, pivot, low, high, i, j)
        if a[j] <= pivot{
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    (a[i], a[high]) = (a[high], a[i])
    //print(a, pivot, low, high, i)
    return i
}

func quicksortLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortLomuto(&a, low: low, high: p - 1)
        quicksortLomuto(&a, low: p + 1, high: high)
    }
}

func quicksortRandom<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortRandom(&a, low: low, high: p - 1)
        quicksortRandom(&a, low: p + 1, high: high)
    }
}

var list1 = [ 10, 0, 3, 9, 2, 14, 26, 27, 1, 5, 8, -1, 8 ]
//let p = partitionLomuto(&list1, low: 0, high: list1.count - 1)
//list1
quicksortLomuto(&list1, low: 0, high: list1.count - 1)

// 分治 Hoare
func partitionHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[low]
    var i = low - 1
    var j = high + 1
    
    while true {
        repeat { j -= 1 } while a[j] > pivot
        repeat { i += 1 } while a[i] < pivot
        
        if i < j {
            a.swapAt(i, j)
        } else {
            return j
        }
    }
}

func quicksortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let p = partitionHoare(&a, low: low, high: high)
        quicksortHoare(&a, low: low, high: p)
        quicksortHoare(&a, low: p + 1, high: high)
    }
}

var list2 = [ 8, 0, 3, 9, 2, 14, 10, 27, 1, 5, 8, -1, 26 ]
//let q = partitionHoare(&list2, low: 0, high: list2.count - 1)
//print(list2)

quicksortHoare(&list2, low: 0, high: list2.count-1)

// 分治 DutchFlag
func partitionDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int, pivotIndex: Int) -> (Int, Int) {
    let pivot = a[pivotIndex]
    
    var smaller = low
    var equal = low
    var larger = high
    
    while equal <= larger {
        if a[equal] < pivot {
            a.swapAt(smaller, equal)
            smaller += 1
            equal += 1
            print("a",a, equal, smaller, larger, pivotIndex)

        } else if a[equal] == pivot {
            equal += 1
            print("b",a, equal, smaller, larger, pivotIndex)

        } else {
            a.swapAt(equal, larger)
            larger -= 1
            print("c",a, equal, smaller, larger, pivotIndex)

        }
    }
    print(a, equal, smaller, larger, pivotIndex)
    return (smaller, larger)
}

func quicksortDutchFlag<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        let (p, q) = partitionDutchFlag(&a, low: low, high: high, pivotIndex: pivotIndex)
        quicksortDutchFlag(&a, low: low, high: p - 1)
        quicksortDutchFlag(&a, low: q + 1, high: high)
    }
}

var list3 = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//partitionDutchFlag(&list3, low: 0, high: list3.count - 1, pivotIndex: 10)
//list3  // show the results

quicksortDutchFlag(&list3, low: 0, high: list3.count - 1)


