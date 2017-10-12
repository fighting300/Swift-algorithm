//: Playground - noun: a place where people can play
// 基本排序算法： 希尔排序 非稳定排序算法
// 把原数据按一定的增量分组(gap)，然后使用插入排序，再逐渐缩小增量

// 复杂度 O(n^2) 最快为O(nlog n)
func insertionSort(_ list: inout [Int], start: Int, gap: Int) {
    for i in stride(from: (start + gap), to: list.count, by: gap) {
        let currentValue = list[i]
        var pos = i
        while pos >= gap && list[pos - gap] > currentValue {
            list[pos] = list[pos - gap]
            pos -= gap
            print(list, pos)
        }
        list[pos] = currentValue
        print(pos, start, gap, currentValue, list)
    }
}

func shellSort(_ list: inout [Int]) {
    var sublistCount = list.count/2
    while sublistCount > 0 {
        for pos in 0..<sublistCount {
            insertionSort(&list, start: pos, gap: sublistCount)
        }
        sublistCount = sublistCount / 2
    }
}

for i in stride(from: 4, to: 9, by: 4) {
    print(i)
}


var arr = [64, 20, 50, 33, 72, 10, 23, -1, 4]

shellSort(&arr)
