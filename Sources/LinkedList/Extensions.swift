import Foundation

extension LinkedList: CustomStringConvertible {
    /// Custom description for `LinkedList`, implementing the `CustomStringConvertible` protocol.
    public var description: String {
        // If the list is empty, return a message
        guard let head = head else {
            return "Empty list"
        }
        
        // Start from the head of the list and initialize an empty result string
        var currentNode: Node? = head
        var result: String = ""
        
        // Traverse each node until reaching the end of the list (a node with `next == nil`)
        while currentNode != nil {
            // Format as "value -> " for the current node
            var str: String = "\(currentNode!.value) -> "
            
            // If this is the last node, remove the arrow to display "value" only
            if currentNode!.next == nil {
                str = "\(currentNode!.value)"
            }
            
            // Append the node string to the result
            result.append(str)
            
            // Move to the next node in the list
            currentNode = currentNode!.next
        }
        return result
    }
}

extension LinkedList.Node: CustomStringConvertible {
    /// Custom description for `Node`, implementing the `CustomStringConvertible` protocol.
    public var description: String {
        return "\(value)"
    }
}
