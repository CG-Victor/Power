//
//  File.swift
//  Power
//
//  Created by Chris Gonzaga on 9/15/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import Foundation
import Firebase

extension Database {
    
    static func fetchUserWithUID(uid: String, completion: @escaping (User) -> ()) {
        
        // b/c we are observing the events
        Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let userDictionary = snapshot.value as? [String: Any] else { return }
            
            print(userDictionary) // breakpoint
            
            let user = User(uid: uid, dictionary: userDictionary)
            
            completion(user)

        }) { (err) in
            print("Failed to fetch user for posts:", err)
        }
    }
}
