//
//  FirstSwiftLib.swift
//  FirstSwiftLib
//
//  Created by Artem on 06.07.2021.
//

import Foundation
import SecondSwiftLib
import FirstObjCLib

@objc open class FirstSwiftLib: NSObject {
    public let text = "This is first swift lib"
    
    @objc public func firstSwiftFunc() -> String {
        text
    }
    
    public func secondSwiftLib() -> String {
        let lib = SecondSwiftLib()
        return lib.text
    }
}
