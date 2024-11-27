import UIKit


struct StackItem<T> {
    var items: [T] = []
    private var index = -1
    
    mutating func pushElement(_ element: T) {
        items.append(element)
        index += 1
    }
    
    mutating func popLastElementWithIndex() {
        if !isEmpty() {
            items.remove(at: index)
            index -= 1
        }
        else {
            index = -1
        }
    }
    
    mutating func popLastItem() -> T? {
        return items.removeLast()
    }
    
    func isEmpty() -> Bool {
        if items.isEmpty {
            return true
        }
        else {
            return false
        }
    }
}

extension StackItem where T: Equatable {
    mutating func popItem(_ item: T) {
        if let findIndex = items.firstIndex(of: item) {
            items.remove(at: findIndex)
        }
    }
}

var stackItem = StackItem<String>()
stackItem.pushElement("ios 12")
stackItem.pushElement("ios 13")
stackItem.pushElement("ios 14")
stackItem.pushElement("ios 15")
stackItem.pushElement("ios 16")
stackItem.pushElement("ios 17")
stackItem.pushElement("ios 18")
stackItem.popLastElementWithIndex()
stackItem.popLastItem()
stackItem.popItem("ios 15")
print(stackItem.items)

