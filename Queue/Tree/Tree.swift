//
//  Tree.swift
//
//
//  Created by Leon on 2017/10/9.
//

public class Node<T> {
    public var value: T
    public var children: [Node] = []
    public weak var parent: Node?
    
    public init(value: T) {
        self.value = value
    }
    
    public func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
        }
        return text
    }
}

extension Node where T: Equatable {
    public func search(value: T) -> Node? {
        if value ==  self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}





