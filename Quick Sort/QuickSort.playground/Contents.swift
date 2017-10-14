//: Playground - noun: a place where people can play
// 快速排序算法： 快速排序 非稳定排序算法
// 把原数据按一定的增量分组(gap)，然后使用插入排序，再逐渐缩小增量
#import Foundation
// 复杂度 O(n^2) 最快为O(nlog n)

func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter( $0 < pivot )
    let equal = a.filter( $0 == pivot )
    let greater = a.filter( $0 > pivot )
    
    return quicksort(less) + equal + quicksort(greater)
}

let list1 = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
quicksort(list1)
