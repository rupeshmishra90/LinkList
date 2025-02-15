import UIKit

class Node{
    var value: Int
    var next: Node?
    init(value: Int, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
/*
let node3 = Node(value: 3)
let node2 = Node(value: 2, next: node3)
let node1 = Node(value: 1, next: node2)
printLinkedListSimple(head: node1)
// We can prin them out by travesing the list
func printLinkedListSimple(head: Node?)
{
    if head == nil {
        return
    }
    var node = head
    print(node?.value ?? 0)
    
    while node?.next != nil{
        print(node?.next?.value ?? 0)
        node = node?.next
    }
}
*/

class LinkList{
    private var head: Node?
    // Add new node at front of list
    func addFront(_ value: Int){
        head = Node(value: value, next: head)
    }
    // Get first added node
    func getFirst()-> Int?{
        if head == nil { return nil }
        return head!.value
    }
    // Add new node at back of list
    func addBack(_ value: Int){
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
            return
        }
        var node = head
        while node?.next != nil{
            node = node?.next
        }
        node?.next = newNode
    }
    // Get last added node
    func getLast()-> Int?{
        if head == nil { return nil }
        var node = head
        while node?.next != nil{
            node = node?.next
        }
        return node!.value
    }
    // Insert data at spesific position
    func insert(position: Int, data: Int){
        if position >= getSize(){
            print("We can't insert the data on this position due to the size of the linked list")
            return
        }
        if position == 0{
            addFront(data)
            return
        }
        let newNode = Node(value: data)
        var currentNode = head
        
        for _ in 0..<(position-1){
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
        
    }
    // Get size of linkedlist
    func getSize()-> Int{
        var count = 0
        var node = head
        while node != nil{
            count += 1
            node = node?.next
        }
        return count
    }
    // Print the linked list
    func printLinkedList()
    {
        if head == nil { return }
        var result = [Int]()
        var node = head
        result.append(node!.value)
        while node?.next != nil{
            result.append(node?.next?.value ?? 0)
            node = node?.next
        }
        print(result)
    }
}

let linkedList = LinkList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()
print(linkedList.getFirst() ?? 0)


linkedList.addFront(4)
linkedList.printLinkedList()
print(linkedList.getFirst() ?? 0)


linkedList.addBack(5)
linkedList.printLinkedList()
print(linkedList.getLast() ?? 0)

linkedList.insert(position: 3, data: 10)
linkedList.printLinkedList()
