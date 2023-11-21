//
//  JournalViewController.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23.
//

import UIKit

class JournalViewController: UIViewController {
    
    
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sadButton: UIButton!
    @IBOutlet weak var angryButton: UIButton!
    @IBOutlet weak var neutralButton: UIButton!
    @IBOutlet weak var emotionLabel: UILabel!
    @IBOutlet weak var happyButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
   
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    var onEntrySaved: ((JournalEntry) -> Void)?
    private var journals: [JournalEntry] = []
    
    var mood = ""
    var dateString = ""
    @IBOutlet weak var submitButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
        
        
        //
    }
    
    func updateLabels() {
        // Create a DateFormatter to format the date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy" // You can customize the format
        
        // Get the current date
        let currentDate = Date()
        
        // Format the date as a string
        dateString = dateFormatter.string(from: currentDate)
        
        // Set the formatted date string to the label
        dateLabel.text = "Today is \(dateString). \nJournal your thoughts 📝"
        emotionLabel.text = "What's your mood?"
        
    }
    func fetchQuote() {
        QuoteService.shared.fetchQuote { result in
            switch result {
            case .success(let quote):
                DispatchQueue.main.async {
                    self.quoteLabel.text = quote.q
                    self.authorLabel.text = "-\(quote.a)"
                }
                
            case .failure(let error):
                print("Error fetching quote: \(error.localizedDescription)")
            }
        }
    }
    @IBAction func angryButtonTapped(_ sender: UIButton) {
        moodLabel.text = "Mood: Angry"
        mood = "Angry"
    }
    @IBAction func neutralButtonTapped(_ sender: UIButton) {
        moodLabel.text = "Mood: Neutral"
        mood = "Neutral"
    }
    @IBAction func sadButtonTapped(_ sender: UIButton) {
        moodLabel.text = "Mood: Sad"
        mood = "Sad"
    }
    @IBAction func happyButtonTapped(_ sender: UIButton) {
        moodLabel.text = "Mood: Happy"
        mood = "Happy"
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let entryText = textField.text, !entryText.isEmpty else {
            // Handle empty entry text
            return
        }
        
    
       let newEntry = JournalEntry(date: dateString, journalText: entryText, mood: mood)
        onEntrySaved?(newEntry)
        textField.text = ""
        moodLabel.text = "Mood:"
        
        

    }
}
extension JournalViewController {


}
