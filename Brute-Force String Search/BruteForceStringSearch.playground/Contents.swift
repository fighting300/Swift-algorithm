// 字符串搜索算法：Brute-Force字符串搜索
import Foundation

extension String {
    func indexOf(_ pattern: String) -> String.Index? {
        for i in self.indices {
            var j = i
            var found = true
            for p in pattern.indices {
                if j == self.endIndex || self[j] != pattern[p] {
                    found = false
                    break
                } else {
                    j = self.index(after: j)
                }
            }

            if found {
                return i
            }
        }
        return nil
    }
}

let s = "Hello, Wor, World,"
//s.indexOf("World")  // 7
s.indexOf("d")  // 7

let animals = "🐶🐔🐷🐮🐱"
//animals.indexOf("🐮")  // 6

