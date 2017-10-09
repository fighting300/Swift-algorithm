//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let trie = Trie()

trie.insert(word: "cute")
trie.contains(word: "cute")

trie.contains(word: "cut")
trie.insert(word: "cut")
trie.contains(word: "cut")

trie.insert(word: "cute")
trie.contains(word: "cute")
