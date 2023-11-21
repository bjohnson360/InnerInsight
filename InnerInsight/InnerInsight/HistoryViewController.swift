//
//  HistoryViewController.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    private var journals: [JournalEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        

       
        fetchJournals()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let journal = journals[indexPath.row]
        cell.textLabel?.text = journal.date
        return cell
    }
    
    func fetchJournals() {
        let journalDataManager = JournalDataManager()
        journals = journalDataManager.entries
        tableView.reloadData()
    }
    
}

