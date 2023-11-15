//
//  JournalEntry.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23.
//

import Foundation

struct JournalEntry: Encodable, Decodable {
    var date: Date
    var journal: String
    var mood: String
}
