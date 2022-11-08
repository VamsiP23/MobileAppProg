//
//  CreateAccountVC.swift
//  Voluntracker
//
//  Created by Putti, Sri Vamsi K on 1/18/22.
//

import UIKit

class CreateAccountVC : UIViewController {
    let defaults = UserDefaults.standard
    @IBOutlet var userField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var goalField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func buttonPressed(_ sender: Any) {
        let goal : Double? = Double(goalField.text!)
        let current = ["Username": userField.text!, "Password": passField.text!, "Hours": 0, "Goal": goal] as [String : Any]
        defaults.set(current, forKey: userField.text!)
        
    }
    
    
    
}
