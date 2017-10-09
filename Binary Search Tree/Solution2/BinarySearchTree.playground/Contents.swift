//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let node5 = BinarySearchTree.node(.empty, "5", .empty)
let nodeA = BinarySearchTree.node(.empty, "a", .empty)
let node10 = BinarySearchTree.node(.empty, "10", .empty)
let node4 = BinarySearchTree.node(.empty, "4", .empty)
let node3 = BinarySearchTree.node(.empty, "3", .empty)
let nodeB = BinarySearchTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinarySearchTree.node(nodeA, "-", node10)
let timesLeft = BinarySearchTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinarySearchTree.node(.empty, "-", node4)
let divide3andB = BinarySearchTree.node(node3, "/", nodeB)
let timesRight = BinarySearchTree.node(minus4, "*", divide3andB)

// root node
let tree = BinarySearchTree.node(timesLeft, "+", timesRight)

print(tree)

tree.count

tree.height


var binaryTree: BinarySearchTree<Int> = .empty
binaryTree = binaryTree.insert(newValue: 7)
binaryTree = binaryTree.insert(newValue: 10)
binaryTree = binaryTree.insert(newValue: 2)
print(binaryTree)

binaryTree.insertNative(newValue: 1)
binaryTree.insertNative(newValue: 5)
binaryTree.insertNative(newValue: 9)
print(binaryTree)

binaryTree.traverseInOrder { print($0) }
binaryTree.traversePreOrder { print($0) }
binaryTree.traversePostOrder { print($0) }

binaryTree.search(searchValue: 5)

