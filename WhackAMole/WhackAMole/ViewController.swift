//
//  ViewController.swift
//  WhackAMole
//
//  Created by Putti, Sri Vamsi K on 9/2/21.
//  Copyright © 2021 Putti, Sri Vamsi K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var screenWidth = 0
    var screenHeight = 0
    var score = 0
    var scoreLbl = UILabel()
    var field = UILabel()
    var mole = UIButton()
    var timer = Timer()
    var firstClick = true
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(bounds.width)
        screenHeight = Int(bounds.height)
        
        scoreLbl.frame = CGRect(x: Int(Double(screenWidth) * 0.1), y: Int(Double(screenHeight) * 0.01), width: Int(Double(screenWidth) * 0.8), height: Int(Double(screenHeight) * 0.1))
        scoreLbl.text = "\(score)"
        scoreLbl.textColor = UIColor.black
        scoreLbl.textAlignment = .center
        view.addSubview(scoreLbl)
        
        field.frame = CGRect(x: Int(Double(screenWidth) * 0.03), y : Int(Double(screenHeight) * 0.1), width: Int(Double(screenWidth) * 0.95), height: Int(Double(screenHeight) * 0.91))
        field.backgroundColor = UIColor.green
        view.addSubview(field)
        
        mole.frame = CGRect(x: Int(Double(screenWidth) * 0.03), y : Int(Double(screenHeight) * 0.1), width: 40, height: 40)
        mole.layer.cornerRadius = 20
        mole.addTarget(self, action: #selector(hitMe(_:)), for: .touchUpInside)
        mole.backgroundColor = UIColor.brown
        mole.setTitle("Start", for: .normal)
        view.addSubview(mole)
        
        
    
    }
    @objc func hitMe(_ sender : UIButton!) {
        if(score == 0 && firstClick) {
            mole.frame = CGRect(x: Int.random(in: (Int(Double(screenWidth) * 0.03)...(Int(Double(screenWidth) * 0.95)))), y: Int.random(in: Int(Double(screenHeight) * 0.1)...Int(Double(screenHeight) * 0.91)), width: 40, height: 40)
            mole.setTitle("", for: .normal)
            firstClick = false
            timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
            return;
        } else {
        while timer.isValid {
        score+=2
        
        timer.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        timerFunction(mole)
            return;
        }
        
    }
    
    @objc func timerFunction(_ sender : UIButton!) {
        score-=1
        scoreLbl.text = "\(score)"
        mole.frame = CGRect(x: Int.random(in: (Int(Double(screenWidth) * 0.02)...(Int(Double(screenWidth) * 0.89)))), y: Int.random(in: Int(Double(screenHeight) * 0.1)...Int(Double(screenHeight) * 0.91)), width: 40, height: 40)
        view.addSubview(mole)
        self.view = view
    }
    
}

