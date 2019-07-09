//
//  Entry.swift
//  JournalCK27
//
//  Created by Austin West on 7/8/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation
import CloudKit

struct Constants {
    static let TitleKey = "title"
    static let BodyKey = "text"
    static let TimestampKey = "timestamp"
    static let TypeKey = "Entry"
}

class Entry {
    
    var text: String
    var body: String
    var timestamp: Date
    var ckRecordID: CKRecord.ID
    
    init(text: String, body: String,  timestamp: Date = Date(), ckRecordID:CKRecord.ID = CKRecord.ID(recordName: UUID().uuidString))  {
        self.text = text
        self.body = body
        self.timestamp = timestamp
        self.ckRecordID = ckRecordID
    }
    
    // Conveniecne INit
//    convenience init?(record: CKRecord) {
//
//    } -------
    
    
}

// Extension on CKRecord (given by swift)
extension CKRecord {
    // Init a CKRecord object by passing in our Message object
    convenience init(entry: Entry) {
        // init type and set the recordID
        self.init(recordType: Constants.TypeKey, recordID: entry.ckRecordID)
        // Set Key value pairs
        self.setValue(entry.text, forKey: Constants.TitleKey)
        self.setValue(entry.body, forKey: Constants.BodyKey)
        self.setValue(entry.timestamp, forKey: Constants.TimestampKey)
    }
}

