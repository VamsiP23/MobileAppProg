//
//  ViewController.swift
//  RGBPicker
//
//  Created by Putti, Sri Vamsi K on 10/25/21.
//

import UIKit

class ViewController: UIViewController {
    var randRed : CGFloat = 0.0
    var randGreen : CGFloat = 0.0
    var randBlue : CGFloat = 0.0
    var timer = Timer()
    var check = 0
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var userColor: UILabel!
    @IBOutlet var matchedColor: UILabel!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var time: UILabel!
    
    var redValue : CGFloat = 0.0
    var blueValue : CGFloat = 0.0
    var greenValue : CGFloat = 0.0
    
    var timeRemaining = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         redValue = CGFloat(redSlider.value)
         blueValue = CGFloat(blueSlider.value)
         greenValue = CGFloat(greenSlider.value)
        userColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        userColor.layer.borderColor = UIColor.black.cgColor
        userColor.layer.borderWidth = 5
        matchedColor.layer.borderColor = UIColor.black.cgColor
        matchedColor.layer.borderWidth = 5
        randRed = CGFloat(Float.random(in: 0...1))
        randGreen = CGFloat(Float.random(in: 0...1))
        randBlue = CGFloat(Float.random(in: 0...1))
        matchedColor.backgroundColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha: 1.0)
        time.text = "Time Remaining: \(timeRemaining)"
        time.textAlignment = .center
    }
    
    @IBAction func redSliderMoved(_ sender: UISlider!) {
        redValue = CGFloat(sender.value)
        check+=1
        userColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        if check == 1 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    @IBAction func greenSliderMoved(_ sender: UISlider!) {
        greenValue = CGFloat(sender.value)
        check+=1
        userColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        if check == 1 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func blueSliderMoved(_ sender: UISlider!) {
        blueValue = CGFloat(sender.value)
        check+=1
        userColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        if check == 1 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerFunction(_ sender : UISlider!) {
        if(timeRemaining != 0) {
            timeRemaining-=1
            time.text = "Time Remaining: \(timeRemaining)"
        }
        else if timeRemaining == 0 {
            timer.invalidate()
            let rDiff = (randRed - redValue) * (randRed - redValue)
            let bDiff = (randBlue - blueValue) * (randBlue - blueValue)
            let gDiff = (randGreen - greenValue) * (randGreen - greenValue)
            
            let space = sqrt(rDiff + bDiff + gDiff)
            var score = (1.0 - space) * 100.0
            if(score < 0) {
                score = 0
            }
            else if(score > 100) {
                score = 100
            }
    
            let alert = UIAlertController(title: "Time's Up!", message: "Score: \(Int(round(score)))", preferredStyle: .alert)
            
            self.present(alert, animated: true)
        }
    }
    
    func reset() {
        timeRemaining = 10
        time.text = "Time Remaing: \(timeRemaining)"
        check = 0
        randRed = CGFloat(Float.random(in: 0...1))
        randGreen = CGFloat(Float.random(in: 0...1))
        randBlue = CGFloat(Float.random(in: 0...1))
        matchedColor.backgroundColor = UIColor(red: randRed, green: randGreen, blue: randBlue, alpha: 1.0)
        redSlider.value = 0.5
        blueSlider.value = 0.5
        greenSlider.value = 0.5
        redValue = CGFloat(redSlider.value)
        blueValue = CGFloat(blueSlider.value)
        greenValue = CGFloat(greenSlider.value)
       userColor.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)

        timer.invalidate()
        
    }
       
    
}

