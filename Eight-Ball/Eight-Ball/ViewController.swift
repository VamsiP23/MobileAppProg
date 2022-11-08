//
//  ViewController.swift
//  Eight-Ball
//
//  Created by Putti, Sri Vamsi K on 9/28/21.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    @IBOutlet var label: UILabel!
    var screenWidth = 0
    var screenHeight = 0
    var answers = ["Likely", "Defnitinely", "No", "Maybe", "Try Again", "Not Likely"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let screenBounds : CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        label.frame = CGRect(x: screenWidth / 4, y: screenHeight / 2 - screenHeight / 20, width: screenWidth / 2, height: screenHeight / 10)
        view.backgroundColor = .black
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.textAlignment = .center
        
        label.text = "Think of a yes or no question"
        view.addSubview(label)
        view.bringSubviewToFront(label)
        
    }
    @objc func timerFunction(_sender : UIButton!) {
        label.text = "Think of a yes or no question"
        timer.invalidate()
    }

    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake && label.text == "Think of a yes or no question" {
            answers.shuffle()
            let text = answers[0]
            label.text = text
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
        
       
    }

}

