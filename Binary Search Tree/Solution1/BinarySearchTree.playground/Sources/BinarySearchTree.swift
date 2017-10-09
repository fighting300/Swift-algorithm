public class BinarySearchTree<T> {
    var value: T
    var leftChild: BinarySearchTree?
    var rightChild: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
}

