//
//  LadningPage.swift
//  Voluntracker
//
//  Created by Putti, Sri Vamsi K on 1/13/22.
//

import UIKit

class LadningPage : UIViewController {
    var header = ""
    @IBOutlet var addB: UIButton!
    let defaults = UserDefaults.standard
    @IBOutlet var currentHours: UILabel!
    @IBOutlet var status: UILabel!
    var VC : ViewController = ViewController(nibName: nil, bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Hello \(header)!"
        var currentDict = defaults.dictionary(forKey: header) as? [String : Any] ?? [:]
        let temp = currentDict["Hours"]!
        let goalHours = currentDict["Goal"]!
        if temp as! Int >= goalHours as! Int {
            status.text = "Goal Reached!"
        }
        currentHours.text = "\(temp) out of \(goalHours) hours"
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        var currentDict = defaults.dictionary(forKey: header) as? [String : Any] ?? [:]
        var hours = currentDict["Hours"] as! Int;
        hours += 1
        currentDict["Hours"] = hours
        let goalHours = currentDict["Goal"]!
        if hours >= goalHours as! Int {
            status.text = "Goal Reached!"
        }
        currentHours.text = "\(hours) out of \(goalHours) hours"
        defaults.setValue(currentDict, forKey: header)
        
    }
    
}
