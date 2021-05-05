import UIKit

//// MARK: - Задача 2
//Реализовать базовый протокол для контейнеров. Контейнеры должны отвечать, сколько они содержат элементов, добавлять новые элементы и возвращать элемент по индексу. На основе базового протокола реализовать универсальный связанныйсписок и универсальную очередь (FIFO) в виде структуры или класса.

protocol Container {
    associatedtype Item
    
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(by index: Int) -> Item? { get }
}


public class LinkedListNode<T> {
   
    var value: T
    var next: LinkedListNode?

    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {

    public typealias Node = LinkedListNode<T>

    private var head: Node?
    private var tail: Node?

    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        return tail
    }
    
}

extension LinkedList: Container {
    
    public func append(_ value: T) {
        
        let newNode = Node(value: value)
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    var count: Int {
        
        var node = head
        var count = 0
        
        if node == nil {
            return count
        } else {
            while node != nil {
                count += 1
                node = node!.next
            }
        }
        return count
        
    }
    
    subscript(by index: Int) -> T? {
        
        var node = head
        var i = 0
        while i != index {
            i += 1
            node = node!.next
        }
        return node?.value
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
    
}

extension LinkedListNode: CustomStringConvertible {
    
    public var description: String {
        return "\(value)"
    }
    
}



let numbers = LinkedList<Int>()
numbers.append(1)
numbers.append(2)
numbers.append(3)
numbers.append(4)
numbers.append(5)
print(numbers)
print(numbers.first)
print(numbers.count)
print(numbers[by: 0])



struct UniversalQueue<T>{
    
    var queue: [T] = []
    
    mutating func enqueue(_ value: T) {
        queue.append(value)
    }
    
    mutating func dequeue() -> T? {
        guard !queue.isEmpty else {
            return nil
        }
        return queue.removeFirst()
    }
    
    var head: T? {
        return queue.first
    }
    
    var tail: T? {
        return queue.last
    }
}

extension UniversalQueue: Container {
    
    mutating func append(_ item: T) {
        queue.append(item)
    }
    
    var count: Int {
        queue.count
    }
    
    subscript(by index: Int) -> T? {
        return queue[index]
    }
    
}

var queue = UniversalQueue<String>()
queue.enqueue("Adam")
queue.enqueue("Julia")
queue.enqueue("Ben")
queue.enqueue("Ken")
queue.enqueue("Lora")
queue.enqueue("Artem")
queue.append("Alex")

let serving = queue.dequeue()
let nextToServe = queue.head
print(queue)
print(queue.count)
print(queue[by: 0])
