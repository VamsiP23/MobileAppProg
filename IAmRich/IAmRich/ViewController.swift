//
//  ViewController.swift
//  IAmRich
//
//  Created by Putti, Sri Vamsi K on 8/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pictureChange: UIImageView!
    @IBOutlet var secondImage: UIImageView!
    @IBOutlet var textLabel: UILabel!
    var status = true
    override func viewDidLoad() {
        super.viewDidLoad()
        changeScreen()
        // Do any additional setup after loading the view.
    }

    fileprivate func changeScreen() {
        if status {
            view.backgroundColor = .green
            textLabel.text = "I AM RICH"
            textLabel.textColor = .black
            pictureChange.isHidden = false
            secondImage.isHidden = true
            
            
        }
        else {
            view.backgroundColor = .brown
            textLabel.text = "I AM POOR"
            textLabel.textColor = .white
            pictureChange.isHidden = true
            secondImage.isHidden = false
            
            
        }
    }
    
    @IBAction func switchScreen(_ sender: Any) {
        status.toggle()
        changeScreen()
    }
    
}

