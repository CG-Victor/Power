//
//  User.swift
//  Power
//
//  Created by Chris Gonzaga on 9/15/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import Foundation
import UIKit

struct User {
    
    let uid: String
    let username: String
    
    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
    }
}
