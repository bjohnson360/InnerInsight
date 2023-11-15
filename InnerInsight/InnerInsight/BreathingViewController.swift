//
//  BreathingViewController.swift
//  InnerInsight
//
//  Created by Brian Johnson on 11/14/23
//

import UIKit

class BreathingViewController: UIViewController {

    @IBOutlet weak var breathIndicatorView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    var isBreathing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        breathIndicatorView.layer.cornerRadius = breathIndicatorView.frame.width / 2
        breathIndicatorView.backgroundColor = UIColor.systemBlue
        updateUI()
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
            isBreathing.toggle()
            updateUI()

            if isBreathing {
                startBreathing()
            } else {
                stopBreathing()
            }
        }

        func startBreathing() {
            UIView.animate(withDuration: 4.0, delay: 0.0, options: [.autoreverse, .repeat], animations: {
                self.breathIndicatorView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }, completion: nil)
        }

        func stopBreathing() {
            UIView.animate(withDuration: 0.3) {
                self.breathIndicatorView.transform = .identity
            }
        }

        func updateUI() {
            let buttonText = isBreathing ? "Stop Breathing" : "Start Breathing"
            startButton.setTitle(buttonText, for: .normal)

            let instructionText = isBreathing ? "Inhale and Exhale with the animation." : "Tap the button to start breathing."
            instructionLabel.text = instructionText
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
