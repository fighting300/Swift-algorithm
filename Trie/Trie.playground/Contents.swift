//树：字典树
import Foundation

var str = "Hello, playground"

let trie = Trie()

trie.insert(word: "cute")
trie.contains(word: "cute")

trie.contains(word: "cut")
trie.insert(word: "cut")
trie.contains(word: "cut")

trie.insert(word: "cute")
trie.contains(word: "cute")
