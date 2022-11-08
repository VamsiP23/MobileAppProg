//
//  ViewController.swift
//  Voluntracker
//
//  Created by Putti, Sri Vamsi K on 1/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var username: UITextField!
    let defaults = UserDefaults.standard
    @IBOutlet var password: UITextField!
    var usernameS = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
            if segue.destination is LadningPage {
                let vc = segue.destination as? LadningPage
                vc?.header = username.text!
            }
        
        
    }
    
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {

    }
    
    @IBAction func lButtonPressed(_ sender: UIButton!) {
        if password.text == defaults.dictionary(forKey: username.text!)?["Password"] as? String && username.text == defaults.dictionary(forKey: username.text!)?["Username"] as? String     {
            usernameS = username.text!
            performSegue(withIdentifier: "Landing", sender: nil)
        }
        else {
            let alert = UIAlertController(title: "Oh No!", message: "Incorrect Username or Password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}

