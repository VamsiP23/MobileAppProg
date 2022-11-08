//
//  ViewController.swift
//  AddOne
//
//  Created by Putti, Sri Vamsi K on 12/1/21.
//

import UIKit

class ViewController : UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var inputField: UITextField!
    var randNum : Int = 0
    var timer = Timer()
    var score = 0
    var counter = 10
    var check = true
    override func viewDidLoad() {
        super.viewDidLoad()
        randNum = Int.random(in: 1000...9999)
        numberLabel.text = String(randNum)
            timeLabel.text = "0:\(counter)"
    }
    
    func compute(viewer : Int, entry : Int) -> Bool {
        var change = viewer
        var other = entry
        var entryA : [Int] = [0, 0, 0, 0]
        var entryB : [Int] = [0, 0, 0, 0]
        for num in 0...3 {
            entryA[num] = (change % 10) + 1
            if(entryA[num] == 10) {
                entryA[num] = 0
            }
            change/=10
        }
        
        for num in 0...3 {
            entryB[num] = (other % 10)
            other/=10
        }
        
        return entryA == entryB
        
    }

    @IBAction func inputFieldChanged(_ sender: UITextField) {
        guard let input = sender.text else { return }
        guard input.count == 4 else { return }
        guard let numberInput = Int(input) else {return}
        if check {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
            check = false
        }
        
        if compute(viewer: randNum, entry: numberInput) {
            score+=1
            scoreLabel.text = String(score)
        } else {
            score-=1
            scoreLabel.text = String(score)
        }
        randNum = Int.random(in: 1000...9999)
        numberLabel.text = String(randNum)
        inputField.text = ""
        
    }
    @objc func timerFunction(_ sender: UITextField) {
        counter-=1
        if counter < 10 && counter >= 0 {
            timeLabel.text = "0:0\(counter)"
        } else if counter >= 10{
            timeLabel.text = "0:\(counter)"
        } else {
            timer.invalidate()
            let alert = UIAlertController(title: "GAME OVER", message: "Score: \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: {_ in self.reset()})); self.present(alert, animated: true)
        }
        
    }
    
    func reset() {
        score = 0
        scoreLabel.text = "0"
        counter = 10
        inputField.text = "000"
        timeLabel.text = "0:\(counter)"
        randNum = Int.random(in: 1000...9999)
        timer = Timer()
        check = true
        numberLabel.text = String(randNum)
        
    }
    
    
   
}


