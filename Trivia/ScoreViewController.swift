//
//  ScoreViewController.swift
//  Trivia
//
//  Created by Putti, Sri Vamsi K on 2/17/22.
//

import UIKit

class ScoreViewController: UIViewController {
    var questionsAnsweredCorrectly = 0
    var numQuestions = 0
    
    @IBOutlet var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(questionsAnsweredCorrectly) out of \(numQuestions)!"
        // Do any additional setup after loading the view.
    }
    
    
    

}
