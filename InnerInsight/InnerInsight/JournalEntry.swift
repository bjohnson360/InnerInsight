//
//  JournalEntry.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23.
//

import Foundation

struct JournalEntry: Codable {
    var date: String
    var journalText: String
    var mood: String
}
extension JournalEntry {
    static var savedKey: String {
        return "saved"
    }
    
    static func save(_ journals: [JournalEntry], forKey key: String) {
        // 1.
        let defaults = UserDefaults.standard
        // 2.
        let encodedData = try! JSONEncoder().encode(journals)
        // 3.
        defaults.set(encodedData, forKey: key)
    }
    
    static func getJournals(forKey key: String) -> [JournalEntry] {
        // 1.
        let defaults = UserDefaults.standard
        // 2.
        if let data = defaults.data(forKey: key) {
            // 3.
            let decodedJournals = try! JSONDecoder().decode([JournalEntry].self, from: data)
            // 4.
            return decodedJournals
        } else {
            // 5.
            return []
        }
    }
    
    func addToSaved() {
        // 1.
        var savedJournals = JournalEntry.getJournals(forKey: JournalEntry.savedKey)
        // 2.
        savedJournals.append(self)
        // 3.
        JournalEntry.save(savedJournals, forKey: JournalEntry.savedKey)
    }
}
