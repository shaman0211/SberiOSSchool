import UIKit


final class Gun {
    var value: Gun
    
    init(_ x: Gun) {
        value = x
    }
}


struct Soldier {
    private var gun: Gun //ref
    var caliberGun: String //value
    init(_ x: Gun, caliber: String) {
        gun = Gun(x)
        caliberGun = caliber
    }

    var tType: Gun {
        get { return gun.value }
        set {
            if (!isKnownUniquelyReferenced(&gun)) {
                gun = Gun(newValue)
                return
            }
            gun.value = newValue
        }
    }
}
