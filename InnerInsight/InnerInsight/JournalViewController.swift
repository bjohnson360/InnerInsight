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
    
    
    var mood = ""
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
        let dateString = dateFormatter.string(from: currentDate)

        // Set the formatted date string to the label
        dateLabel.text = "Today is \(dateString). \nJournal your thoughts 📝"
        emotionLabel.text = "What's your mood?"
        
        }
    @IBAction func angryButtonTapped(_ sender: UIButton) {
        moodLabel.text = "Mood: Angry"
    }
    @IBAction func neutralButtonTapped(_ sender: UIButton) {
        moodLabel.text = "Mood: Neutral"
    }
    @IBAction func sadButtonTapped(_ sender: UIButton) {
        moodLabel.text = "Mood: Sad"
    }
    @IBAction func happyButtonTapped(_ sender: UIButton) {
        moodLabel.text = "Mood: Happy"
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        textField.text = ""
        
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
extension JournalViewController {

    func submitJournalEntry() {
        guard let title = textField.text, !title.isEmpty else {
            // Handle empty title or content
            return
        }

        let currentDate = Date()
        let newEntry = JournalEntry(date: currentDate, journal: title, mood: mood)

        JournalDataManager.shared.addEntry(newEntry)

        // Optionally, you can perform additional actions, such as dismissing the view controller
        // or updating the UI to reflect the submission.

        // For example:
        // self.dismiss(animated: true, completion: nil)
    }

}
