//
//  ViewController.swift
//  Login
//
//  Created by Putti, Sri Vamsi K on 1/7/22.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var username: UITextField!
    @IBOutlet var forgotUser: UIButton!
    @IBOutlet var forgotPassword: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         guard let sender = sender as? UIButton else {return}
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        } else if sender == forgotUser {
            segue.destination.navigationItem.title = "Forgot Username"
        } else {
            segue.destination.navigationItem.title = username.text
        }
        
    
    }

    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "logged", sender: sender)
    }
    
    @IBAction func userPressd(_ sender: UIButton!) {
        performSegue(withIdentifier: "Forgot", sender: sender)
    }
    
    @IBAction func passwordPressed(_ sender: UIButton!) {
        performSegue(withIdentifier: "Forgot", sender: sender)
    }
    
}
    
    
    
    
    




