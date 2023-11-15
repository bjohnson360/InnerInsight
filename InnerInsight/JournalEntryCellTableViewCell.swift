//
//  JournalEntryCellTableViewCell.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23.
//

import UIKit

class JournalEntryCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    func configure(with entry: JournalEntry) {
        dateLabel.text = DateFormatter.localizedString(from: entry.date, dateStyle: .short, timeStyle: .short)
        
    }

}
