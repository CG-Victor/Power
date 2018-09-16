//
//  Entry.swift
//  Power
//
//  Created by Chris Gonzaga on 8/28/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import Foundation

struct JournalEntry {
    var id: String? // always some sort of id in every model
    
    let user: User
    let title: String
    let text: String
    let creationDate: Date
    
    init(user: User, dictionary: [String: Any]) { // edit things properly with dictionary
        self.user = user
        self.title = dictionary["title"] as? String ?? ""
        self.text = dictionary["text"] as? String ?? ""
        
        let secondsFrom1970 = dictionary["creationDate"] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: secondsFrom1970)
        
        
    }
}


// old


/*
 so we don't need these parameters?
init(user: User, title: String, text: String, dictionary: [String: Any]) { // edit things properly with dictionary
    self.user = user
    self.title = dictionary["title"] as? String ?? ""
    self.text = dictionary["caption"] as? String ?? ""
    
    let secondsFrom1970 = dictionary["creationDate"] as? Double ?? 0
    self.creationDate = Date(timeIntervalSince1970: secondsFrom1970)


*/



