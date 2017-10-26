// 队列：栈
// push pop 后进先出 LIFO
import Foundation
// 栈溢出(stack overflow) 每次你调用函数或方法，CPU 都会将函数返回地址压入到运行栈中。当这个函数执行结束的时候，CPU 将返回地址从栈中取出，并据此返回到函数被调用的位置。所以，如果不断地调用太多的函数(例如死递归函数)，就会得到一个所谓的“栈溢出(stack overflow)” 错误，因为 CPU 运行栈没有空间了。
public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    public mutating func push(_ element: T) {
        array.append(element)
    }
    public mutating func pop() -> T? {
        return array.popLast()
        /*
        if isEmpty {
            return nil
        } else {
            return array.removeLast()
        }*/
    }
    public func peek() -> T? {
        return array.last
    }
    public var top: T? {
        return array.last
    }
}

var stackOfNames = Stack(array: ["Carl", "Lisa", "Stephanie", "Jeff", "Wade"])
stackOfNames.push("Mike")
print(stackOfNames.array)
stackOfNames.pop()
stackOfNames.top
stackOfNames.isEmpty

