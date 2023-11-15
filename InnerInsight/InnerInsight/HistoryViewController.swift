//
//  HistoryViewController.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var journalEntries: [JournalEntry] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJournalEntries()

        // Do any additional setup after loading the view.
    }
    private func loadJournalEntries() {
        journalEntries = JournalDataManager.shared.journalEntries
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension HistoryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalCell", for: indexPath)
        let entry = journalEntries[indexPath.row]
        cell.textLabel?.text = entry.date.formatted()
        cell.detailTextLabel?.text = DateFormatter.localizedString(from: entry.date, dateStyle: .short, timeStyle: .short)
        return cell
    }

}
