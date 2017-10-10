//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// root node
let tree = BinarySearchTree<Int>(value: 7)
tree.insert(value: 2)
tree.insert(value: 5)
tree.insert(value: 10)
tree.insert(value: 9)
tree.insert(value: 1)

let toDelete = tree.search(value: 1)
toDelete?.remove()
print(tree)

tree.search(value: 7)

tree.traverseInOrder { value in print(value) }

tree.toArray()

tree.minimum()
tree.maximum()

if let node2 = tree.search(value: 2) {
    node2.remove()
    print(tree)
}

tree.height()
tree.predecessor()
tree.successor()

if let node10 = tree.search(value: 10) {
    node10.depth()        // 1
    node10.height()       // 1
    node10.predecessor()
    node10.successor()    // nil
}

if let node9 = tree.search(value: 9) {
    node9.depth()        // 2
    node9.height()       // 0
    node9.predecessor()
    node9.successor()
}


