import UIKit


class NodeLinked<T> {
    var value: T
    var next: NodeLinked<T>?
    init(value: T) {
        self.value = value
        self.next = nil
    }
}

class LinkedList<T:Equatable> {
    var head: NodeLinked<T>?
    
    func appendValue(value: T) {
        let newNode = NodeLinked(value: value)
        if head == nil {
            head = newNode
        }
        else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }
    
    func delete(value: T) {
        if head == nil {
            return
        }
        if head?.value == value {
            head = head?.next
            return
        }
        
        var previous: NodeLinked<T>? = nil
        var current = head
        while current != nil {
            if current?.value == value {
                previous?.next = current?.next
            }
            previous = current
            current = current?.next
        }
    }
    
    func printLinkedList() {
        var current = head
        while current != nil {
            print(current?.value ?? 0, terminator: "-")
            current = current?.next
        }
    }
}


let linkedList = LinkedList<Int>()
linkedList.appendValue(value: 10)
linkedList.appendValue(value: 11)
linkedList.appendValue(value: 12)
linkedList.appendValue(value: 13)
linkedList.appendValue(value: 14)
linkedList.appendValue(value: 15)
//linkedList.printLinkedList()

linkedList.delete(value: 14)
linkedList.printLinkedList()
