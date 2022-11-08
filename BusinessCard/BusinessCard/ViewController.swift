//
//  ViewController.swift
//  BusinessCard
//
//  Created by Putti, Sri Vamsi K on 10/19/21.
//

import UIKit

class ViewController: UIViewController {

    var photo = UIImageView()
    var name = UILabel()
    var occupation = UILabel()
    var email = UILabel()
    var phone = UILabel()
    var button = UIButton()
    var status = false
    var screenWidth = 0
    var screenHeight = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let bounds: CGRect = UIScreen.main.bounds
        screenWidth = Int(bounds.width)
        screenHeight = Int(bounds.height)
        photo.image = UIImage(named: "selfpic.jpg")
        photo.frame = CGRect(x: screenWidth / 5, y: Int(Double(screenHeight) / 6.3) , width: 250, height: 250)
        photo.layer.cornerRadius = 125
        photo.clipsToBounds = true
        photo.layer.borderWidth = 5
        photo.layer.borderColor = UIColor.white.cgColor
        photo.layer.masksToBounds = true
        
        view.addSubview(photo)
        view.backgroundColor = UIColor(red:0.83, green:0.38, blue:0.29, alpha:1.0)
        
        name.frame = CGRect(x:0, y: Int(Double(screenHeight) / 2.2) , width: screenWidth, height:100)
        name.text = "Vamsi Putti"
        name.textAlignment = .center
        name.font = UIFont(name: "Bodoni 72 Smallcaps", size: 30)
        view.addSubview(name)
        
        occupation.frame = CGRect(x:0, y: Int(Double(screenHeight) / 2) , width: screenWidth, height:100)
        occupation.text = "Student at Heritage High School"
        occupation.textAlignment = .center
        occupation.font = UIFont(name: "Bodoni 72 Smallcaps", size: 25)
        view.addSubview(occupation)
        
        button.frame = CGRect(x: screenWidth / 4, y: Int(Double(screenHeight) / 1.8), width: 2 * (screenWidth / 4) , height:100)
        button.setTitle("Tap Here for More Info", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 17)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        view.addSubview(button)
        
        email.frame = CGRect(x:0, y: Int(Double(screenHeight) / 1.5), width: screenWidth, height:25)
        email.text = "srivamsi.putti.175@k12.friscoisd.org"
        email.font = UIFont(name: "Avenir", size: 15)
        email.textAlignment = .center
        email.layer.cornerRadius = 10
        email.clipsToBounds = true
        email.backgroundColor = .black
        email.textColor = .white
        
        phone.frame = CGRect(x:0, y: Int(Double(screenHeight) / 1.4), width: screenWidth, height:25)
        phone.text = "(940) 703 8112"
        phone.font = UIFont(name: "Avenir", size: 15)
        phone.layer.cornerRadius = 10
        phone.clipsToBounds = true
        phone.textAlignment = .center
        phone.backgroundColor = .black
        phone.textColor = .white
        
        phone.isHidden = true
        email.isHidden = true
        view.addSubview(email)
        view.addSubview(phone)
        
    }
    
    @objc func buttonPressed(_ sender : UIButton!) {
        if !status {
            phone.isHidden = false
            email.isHidden = false
            button.setTitle("Tap Here to Hide Info", for: .normal)
            
            status = true
        }
        else {
            phone.isHidden = true
            email.isHidden = true
            button.setTitle("Tap Here to Show Info", for: .normal)
            status = false
        }
    }


}

