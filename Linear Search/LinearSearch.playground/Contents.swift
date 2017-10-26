// 搜索算法: 线性搜索
// 从数据中查找某个元素
func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
    for (index, obj) in array.enumerated() where obj == object {
        return index
    }
    return nil
}

func linearSearch1<T: Equatable>(_ array: [T], _ object: T) -> Array<T>.Index? {
    return array.index { $0 == object }
}

let array = [5, 2, 4, 7]
linearSearch(array, 2)
linearSearch(array, 3)

linearSearch1(array, 4)
