import Foundation

class TrieNode<T: Hashable> {
    var value: T?
    weak var parent: TrieNode?
    var children: [T: TrieNode] = [:]
    var isTerminating = false
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
    }
    
    func add(value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode(value: value, parent: self)
    }
}

public class Trie {
    typealias Node = TrieNode<Character>
    fileprivate let root: Node
    
    public init() {
        root = Node()
    }
}

extension Trie {
    public func insert(word: String) {
        guard !word.isEmpty else {
            return
        }
        var curentNode = root
        
        let characters = Array(word.lowercased().characters)
        var currentIndex = 0
        
        while currentIndex < characters.count {
            let character = characters[currentIndex]
            if let child = curentNode.children[character] {
                curentNode = child
            } else {
                curentNode.add(value: character)
                curentNode = curentNode.children[character]!
            }
            currentIndex += 1
        }
        if currentIndex == characters.count {
            curentNode.isTerminating = true
        }
    }
    
    public func contains(word: String) -> Bool {
        guard !word.isEmpty else {
            return false
        }
        var currentNode = root
        
        let characters = Array(word.lowercased().characters)
        var currentIndex = 0
        while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
            currentIndex += 1
            currentNode = child
        }
        
        if currentIndex == characters.count && currentNode.isTerminating {
            return true
        } else {
            return false
        }
        
    }
}
