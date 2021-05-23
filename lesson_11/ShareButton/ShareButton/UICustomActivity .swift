//
//  UIActivity .swift
//  ShareButton
//
//  Created by Artem  on 23.05.2021.
//

import UIKit

class UICustomActivity: UIActivity {
    var _activityTitle: String
    var activityItems = [Any]()
    var action: ([Any]) -> Void
    
    init(title: String, performAction: @escaping ([Any]) -> Void) {
        _activityTitle = title
        action = performAction
        super.init()
    }
    
    override var activityTitle: String? {
        return _activityTitle
    }
    
    override var activityType: UIActivity.ActivityType {
        return UIActivity.ActivityType(rawValue: "com.artem.shareButton.activity")
    }

    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        self.activityItems = activityItems
    }
    
    override func perform() {
        action(activityItems)
        activityDidFinish(true)
    }
}
