//
//  Entry.swift
//  Power
//
//  Created by Chris Gonzaga on 8/28/18.
//  Copyright © 2018 Chris Gonzaga. All rights reserved.
//

import Foundation

struct JournalEntry {
    var id: String?
    
    let title: String
    let text: String
    let creationDate: Date
    
    init(title: String, text: String, dictionary: [String: Any]) {
        
        self.title = title
        self.text = text
        
        let secondsFrom1970 = dictionary["creationDate"] as? Double ?? 0
        self.creationDate = Date(timeIntervalSince1970: secondsFrom1970)
        
        
    }
}
