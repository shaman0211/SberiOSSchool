import UIKit

class iPhone {
    var osVersion = ""
    var name = ""
    
    func setOSVersion() {
        self.osVersion = ""
    }
    
    func setName() {
        self.name = ""
    }
}

class iPhoneBuilder {

    let phone = iPhone()
 
    func getPhone() -> iPhone  {
        return self.phone
    }
    
}

class iPhoneXBuilder: iPhoneBuilder {
    func setOSVersion() {
        self.phone.osVersion = "12.0"
    }
    
    func setName() {
        self.phone.name = "iPhone X"
    }
    
}

class iPhone11Builder: iPhoneBuilder {
    func setOSVersion() {
        self.phone.osVersion = "13.0"
    }
    
    func setName() {
        self.phone.name = "iPhone 11"
    }
    
}

class iPhoneFactory {
    
    var builder = iPhoneBuilder()
    
    func setBuilder(firstBuilder: iPhoneBuilder) {
        self.builder = firstBuilder
    }
    
    func getPhone() -> iPhone {
        return self.builder.getPhone()
    }
    
    func constuctPhone() {
            
        if let builder = builder as? iPhoneXBuilder {
            builder.setOSVersion()
            builder.setName()
        } else if let builder = builder as? iPhone11Builder {
            builder.setOSVersion()
            builder.setName()
        }
    }
}

let firstiPhoneBuilder = iPhoneXBuilder()
let secondiPhoneBuilder = iPhone11Builder()

let director = iPhoneFactory()
director.setBuilder(firstBuilder: firstiPhoneBuilder)
director.constuctPhone()
let firstPhone = director.getPhone()
print("First phone create whith name \(firstPhone.name), phone os version: \(firstPhone.osVersion)")

director.setBuilder(firstBuilder: secondiPhoneBuilder)
director.constuctPhone()
let secondPhone = director.getPhone()
print("Second phone create whith name \(secondPhone.name), phone os version: \(secondPhone.osVersion)")

