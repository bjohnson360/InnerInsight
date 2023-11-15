//
//  ViewController.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/10/23.
//

import UIKit

class JournalViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
//    private var quotes = [Quote]()
//    struct quote {
//        let quote: String
//        
    }
    
    func viewDidLoad() {
        super.viewDidLoad()
//        QuoteService.fetchQuestions{ [weak self] questions in
//            guard let self = self else {return}
//            self.quotes = quotes
            
        updateDateLabel()
        }
        
//        func updateQuote(withQuoteIndex quoteIndex: Int) {
//            let quote = quotes[quoteIndex]
//            
//            quoteLabel.text = quote.q
//            authorLabel.text = quote.a
//        }
        func updateDateLabel() {
                // Create a DateFormatter to format the date
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM dd, yyyy" // You can customize the format

                // Get the current date
                let currentDate = Date()

                // Format the date as a string
                let dateString = dateFormatter.string(from: currentDate)

                // Set the formatted date string to the label
                dateLabel.text = "Today is \(dateString). How are you feeling?"
            }
        
    


