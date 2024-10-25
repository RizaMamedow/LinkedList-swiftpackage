import Foundation

import Foundation

/// A generic linked list implementation in Swift that allows storing values of any type `T`.
public struct LinkedList<T> {
    
    /// The first node (or element) in the linked list.
    var head: Node?
    
    /// The last node (or element) in the linked list.
    var tail: Node?

    /// Initializes an empty linked list without any elements.
    init () {}

    /// Initializes a linked list from an array of optional elements, ignoring `nil` values.
    ///
    /// - Parameter data: An array of optional elements of type `T`.
    ///                  Only non-nil elements are added to the list in the order they appear in the array.
    init (_ data: [T?]) {
        for item in data {
            if let item = item {
                self.append(item)
            }
        }
    }
    
    /// A Boolean value indicating whether the linked list is empty.
    /// - Returns: `true` if the list has no elements (i.e., `head` is `nil`), otherwise `false`.
    var isEmpty: Bool {
        head == nil
    }
    
    /// Inserts a new element at the beginning of the linked list.
    /// This operation effectively pushes the new element as the head node.
    ///
    /// - Parameter value: The element to be inserted at the beginning of the list.
    /// - Complexity: O(1) because it only involves updating the `head` reference.
    mutating func push(_ value: T) -> Void {
        // Create a new node where `next` points to the current head
        head = Node(value: value, next: head)
        
        // If the list was empty, the new head is also the tail.
        if tail == nil {
            tail = head
        }
    }
    
    /// Appends a new element at the end of the linked list.
    /// If the list is empty, this method delegates to `push(_:)` to add the element as the head.
    ///
    /// - Parameter value: The element to be appended to the end of the list.
    /// - Complexity: O(1) if the list has a tail node, as it only updates the `tail` reference.
    mutating func append(_ value: T) -> Void {
        // Check if the list is empty. If so, push the element as the first node.
        guard !isEmpty else {
            push(value)
            return
        }
        
        // Append to the end by updating the tail's `next` pointer.
        tail?.next = Node(value: value)
        
        // Move the tail pointer to the new last node.
        tail = tail?.next
    }
    
    /// The number of elements in the linked list.
    /// This is determined by traversing the entire list from `head` to `tail`.
    ///
    /// - Returns: An integer representing the count of nodes in the list.
    /// - Complexity: O(n) where `n` is the number of nodes, as each node is visited once.
    public var count: Int {
        var currentNode = head
        var counter = 0
        while currentNode != nil {
            counter += 1
            currentNode = currentNode?.next
        }
        return counter
    }
    
    /// Returns the node at a specified index in the linked list.
    ///
    /// - Parameter index: The zero-based index of the node to retrieve.
    /// - Returns: The node located at the specified index.
    /// - Warning: Triggers a runtime error if the index is out of bounds.
    /// - Complexity: O(n) where `n` is the number of nodes up to the specified index.
    public func getNode(at index: Int) -> Node {
        guard index >= 0 else {
            fatalError("Index out of range. Index must be a non-negative integer.")
        }
        
        var currentNode = head
        var currentIndex = 0
        
        while let node = currentNode {
            if currentIndex == index {
                return node
            }
            currentNode = node.next
            currentIndex += 1
        }
        
        fatalError("Index out of range. Index exceeds the bounds of the list.")
    }
    
    /// Returns the second-to-last node in the linked list, if it exists.
    ///
    /// - Returns: The node immediately preceding the last node in the list, or `nil` if there are fewer than two nodes.
    /// - Complexity: O(n) where `n` is the number of nodes, as it uses `getNode(at:)`.
    var penult: Node? {
        if count > 1 {
            return getNode(at: count - 2)
        }
        return nil
    }

    /// Converts the linked list to an array of its elements.
    ///
    /// - Returns: An array containing all elements in the list in their original order.
    /// - Complexity: O(n) where `n` is the number of nodes, as each node is visited once.
    func toArray() -> [T] {
        var array: [T] = []
        
        var currentNode = head
        while let node = currentNode {
            array.append(node.value)
            currentNode = node.next
        }
        
        return array
    }
    
    /// Converts the linked list to a dictionary, where each key is the node's index and the value is the element at that index.
    ///
    /// - Returns: A dictionary with integer keys representing node indices and values of type `T`.
    /// - Complexity: O(n) where `n` is the number of nodes, as each node is visited once.
    func toDictionary() -> Dictionary<Int, T> {
        var dict: Dictionary<Int, T> = [:]
        
        var currentNode = head
        var currentIndex = 0
        while let node = currentNode {
            dict[currentIndex] = node.value
            currentNode = node.next
            currentIndex += 1
        }
        
        return dict
    }
    
    /// Sorts the linked list in place using a specified predicate for comparison.
    ///
    /// - Parameter areInIncreasingOrder: A closure that takes two elements of type `T` and returns `true` if the first element should be ordered before the second.
    /// - Complexity: O(n^2) in the worst case, as it involves repeatedly inserting nodes in sorted order.
    mutating func sort(by areInIncreasingOrder: (T, T) -> Bool) where T: Comparable {
        // If the list is empty or has only one element, it’s already sorted.
        guard head != nil else { return }

        // Start with an empty sorted list.
        var sortedList: Node? = nil
        var current = head

        // Insert each element into the sorted list.
        while current != nil {
            let next = current!.next

            if sortedList == nil || areInIncreasingOrder(current!.value, sortedList!.value) {
                current!.next = sortedList
                sortedList = current
            } else {
                var temp = sortedList
                while temp!.next != nil && !areInIncreasingOrder(current!.value, temp!.next!.value) {
                    temp = temp!.next
                }
                current!.next = temp!.next
                temp!.next = current
            }

            current = next
        }

        // Update `head` and `tail` to point to the sorted list.
        head = sortedList

        // Update `tail` to the last node in the sorted list.
        tail = head
        while tail?.next != nil {
            tail = tail?.next
        }
    }
    
    /// Represents a node in the linked list, holding a value and a reference to the next node.
    public class Node {
        /// The value contained in the node.
        var value: T
        
        /// The next node in the linked list, if it exists.
        var next: Node?

        /// Initializes a new node with a specified value and an optional reference to the next node.
        ///
        /// - Parameters:
        ///   - value: The value to store in the node.
        ///   - next: The next node in the linked list, or `nil` if this node is the last.
        init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }
}
