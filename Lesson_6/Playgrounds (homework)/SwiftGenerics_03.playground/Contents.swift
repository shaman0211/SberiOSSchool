import UIKit

// MARK: - Задача 3*. К выполнению необязательна. 

indirect enum LinkedList<T> {
    case Empty
    case Node(value: T, next: LinkedList<T>)
    
    init() { self = .Empty }
}

extension LinkedList {
    func cons(x: T) -> LinkedList<T> {
        return .Node(value: x, next: self)
    }
}

extension LinkedList {
    
    mutating func push(item: T) {
        self = .Node(value: item, next: self)
    }
    
    mutating func pop() -> T? {
        switch self {
        case let .Node(value, next):
            self = next
            return value
        case .Empty:
            return nil
        }
    }
    
    func peek() -> T? {
        switch self {
        case let .Node(value, _):
            return value
        case .Empty:
            return nil
        }
    }
    
}

var list = LinkedList<Int>()
list.push(item: 3)
list.push(item: 4)
list.push(item: 5)
print(list)
