import UIKit

//MARK: - Direct Dispatch
class DirectDispatchFirstExample {}

extension DirectDispatchFirstExample {
    func showDirectDispatch() {
        print("DirectDispatchFirstExample.showDirectDispatch()")
    }
}

struct DirectDispatchSecondExample {
    func showDirectDispatch() {
        print("DirectDispatchSecondExample.showDirectDispatch()")
    }
}

final class DirectDispatchThirdExample {
    func showDirectDispatch() {
        print("DirectDispatchThirdExample.showDirectDispatch()")
    }
}

//MARK: - Virual Table
class VirtualTable {
    func showVirtualTable() {
        print("VirtualTable.showVirtualTable()")
    }
}


//MARK: - Witness Table
protocol WitnessTableProtocol {
    func showWitnessTable ()
}

class WitnessTable : WitnessTableProtocol {
    func showWitnessTable() {
        print("WitnessTable.showWitnessTable()")
    }
}

//MARK: - Message Dispatch
@objcMembers
class MessageDispatch : NSObject {
    dynamic func sayHello() {
        print("MessageDispatch.sayHello")
    }
}
