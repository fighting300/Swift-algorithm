// 算法题：
import Foundation
// 时间复杂度: O(n) 空间复杂度: O(n)
func twoSum(_ nums: [Int], target: Int) -> (Int, Int)? {
    var dict = [Int: Int]()
    
    for (currentIndex, n) in nums.enumerated() {
        let complement = target - n
        if let complementIndex = dict[complement] {
            return (complementIndex, currentIndex)
        }
        dict[n] = currentIndex
    }
    return nil
}


func twoSumProblem(_ a: [Int], k: Int) -> ((Int, Int))? {
    var i = 0
    var j = a.count - 1
    while i < j {
        let sum = a[i] + a[j]
        if sum == k {
            return (i, j)
        } else if sum < k {
            i += 1
        } else {
            j -= 1
        }
    }
    return nil
}
