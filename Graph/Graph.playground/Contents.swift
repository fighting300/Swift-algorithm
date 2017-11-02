// 图：图
import Foundation

public struct Edge<T>: Equatable where T: Hashable {
    public let from: Vertex<T>
    public let to: Vertex<T>
    public let weight: Double?
}

extension Edge: CustomStringConvertible {
    public var description: String {
        guard let unwrappedWeight = weight else {
            return "\(from.description) -> \(to.description)"
        }
        return "\(from.description) -> \(unwrappedWeight) -> \(to.description)"
    }
}

extension Edge: Hashable {
    public var hashValue: Int {
        var string = "\(from.description)\(to.description)"
        if weight != nil {
            string.append("\(weight!)")
        }
        return string.hashValue
    }
}

public func == <T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    guard lhs.from == rhs.from else {
        return false
    }
    guard lhs.to == rhs.to else {
        return false
    }
    guard lhs.weight == rhs.weight else {
        return false
    }
    return true
}

private var uniqueIDCounter = 0

public struct Vertex<T>: Equatable where T: Hashable {
    public var data: T
    public let uniqueID: Int
    
    private(set) public var edges: [Edge<T>] = []
    
    public init(data: T) {
        self.data = data
        uniqueID = uniqueIDCounter
        uniqueIDCounter += 1
    }
    
    public mutating func connectTo(_ destinationVertex: Vertex<T>, withWeight weight: Double = 0) {
        edges.append(Edge(from: self, to: destinationVertex, weight: weight))
    }
    
    public mutating func connectBetween(otherVertex: inout Vertex<T>, withWeight weight: Double = 0) {
        connectTo(otherVertex, withWeight: weight)
        otherVertex.connectTo(self, withWeight: weight)
    }
    
    public func edgeTo(otherVertex: Vertex<T>) -> Edge<T>? {
        for e in edges where e.to.uniqueID == otherVertex.uniqueID {
            return e
        }
        return nil
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(index): \(data)"
    }
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)\(index)".hashValue
    }
}

public func ==<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.uniqueID == rhs.uniqueID else {
        return false
    }
    guard lhs.data == rhs.data else {
        return false
    }
    return true
}

var v1 = Vertex(data: 1)
var v2 = Vertex(data: 2)
var v3 = Vertex(data: 3)
var v4 = Vertex(data: 4)
var v5 = Vertex(data: 5)

v1.connectTo(v2, withWeight: 1.0)
v2.connectTo(v3, withWeight: 1.0)
v3.connectTo(v4, withWeight: 4.5)
v4.connectTo(v1, withWeight: 2.8)
v2.connectTo(v5, withWeight: 3.2)



