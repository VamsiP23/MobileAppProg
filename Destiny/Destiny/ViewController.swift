//
//  ViewController.swift
//  Destiny
//
//  Created by Putti, Sri Vamsi K on 9/14/21.
//  Copyright © 2021 Putti, Sri Vamsi K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var choice1: UIButton!
    @IBOutlet var setTitle: UILabel!
    @IBOutlet var choice2: UIButton!
    @IBOutlet var background: UIImageView!
    var screenWidth = 0
    var screenHeight = 0
    var game = Destiny()
    fileprivate func setScreen() {
        // Do any additional setup after loading the view.
        
        setTitle.text = game.getTitle()
        setTitle.textAlignment = .center
        setTitle.lineBreakMode = .byWordWrapping
        setTitle.numberOfLines = 0
        view.backgroundColor = .black
        setTitle.textColor = .black
        setTitle.frame = CGRect(x: 10, y: screenHeight/2 - screenHeight/15, width: screenWidth-20, height: screenHeight/7)
        view.bringSubviewToFront(setTitle)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenBounds : CGRect = UIScreen.main.bounds
        screenWidth = Int(screenBounds.width)
        screenHeight = Int(screenBounds.height)
        setScreen()
        choice1.setTitle(game.getChoice1(), for: .normal)
        choice1.frame = CGRect(x: 20, y: 40, width: screenWidth - 35, height: Int(Double(screenHeight)/2.8))
        choice1.titleLabel?.lineBreakMode = .byWordWrapping
        choice1.titleLabel?.textAlignment = .center
        choice1.backgroundColor = .lightGray
        choice1.setTitleColor(.black, for: .normal)
        choice1.layer.cornerRadius = 15
        choice1.layer.borderWidth = 7
        choice1.layer.borderColor = UIColor.black.cgColor
        choice2.setTitle(game.getChoice2(), for: .normal)
        choice2.frame = CGRect(x: 20, y: screenHeight / 2 + 60, width: screenWidth - 35, height: Int(Double(screenHeight)/2.8))
        choice2.setTitleColor(.systemBlue, for: .normal)
        choice2.titleLabel?.lineBreakMode = .byWordWrapping
        choice2.titleLabel?.textAlignment = .center
        choice2.backgroundColor = .red
        choice2.setTitleColor(.black, for: .normal)
        choice2.layer.cornerRadius = 15
        choice2.layer.borderWidth = 7
        choice2.layer.borderColor = UIColor.black.cgColor
        view.sendSubviewToBack(background)
    }
    
    fileprivate func updateText() {
        setTitle.text = game.getTitle()
        choice1.setTitle(game.getChoice1(), for: .normal)
        choice2.setTitle(game.getChoice2(), for: .normal)
    }
    
    @IBAction func firstPress(_ sender: Any) {
        if game.currentStory >= 0 {
            game.currentStory = game.stories[game.currentStory].choice1Index
            if(game.currentStory >= 0) {
                updateText()
            }
        }
    }
    
    @IBAction func twoPressed(_ sender: Any) {
        if game.currentStory >= 0 {
            game.currentStory = game.stories[game.currentStory].choice2Index
            if(game.currentStory >= 0) {
                updateText()
            }
            
        }
        
    }
 
    

}

