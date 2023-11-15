//
//  JournalDataManager.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23.
//

import Foundation

class JournalDataManager {

    static let shared = JournalDataManager()

    private let userDefaults = UserDefaults.standard
    private let entriesKey = "JournalEntries"

    var journalEntries: [JournalEntry] {
        get {
            if let data = userDefaults.data(forKey: entriesKey),
               let entries = try? JSONDecoder().decode([JournalEntry].self, from: data) {
                return entries
            }
            return []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                userDefaults.set(data, forKey: entriesKey)
            }
        }
    }

    func addEntry(_ entry: JournalEntry) {
        var entries = journalEntries
        entries.append(entry)
        journalEntries = entries
    }
}
