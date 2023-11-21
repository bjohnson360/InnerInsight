//
//  JournalDataManager.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23.
//

import Foundation

class JournalDataManager {

    var entries: [JournalEntry] {
            get {
                if let data = UserDefaults.standard.data(forKey: JournalEntry.savedKey),
                   let savedEntries = try? JSONDecoder().decode([JournalEntry].self, from: data) {
                    return savedEntries
                }
                return []
            }
            set {
                if let encodedData = try? JSONEncoder().encode(newValue) {
                    UserDefaults.standard.set(encodedData, forKey: JournalEntry.savedKey)
                }
            }
        }

        // Function to add a new journal entry
    func addEntry(date: String, journalText: String, mood: String) {
            let newEntry = JournalEntry(date: date, journalText: journalText, mood: mood)
            var updatedEntries = entries
            updatedEntries.append(newEntry)
            entries = updatedEntries
        }
}
