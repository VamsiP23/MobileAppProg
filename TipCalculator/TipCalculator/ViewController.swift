//
//  ViewController.swift
//  TipCalculator
//
//  Created by Putti, Sri Vamsi K on 11/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tipAmt: UILabel!
    @IBOutlet var total: UILabel!
    @IBOutlet var input: UITextField!
    @IBOutlet var tip: UISegmentedControl!
    @IBOutlet var reset: UIButton!
    
    var billAmount : Double? = 0.0
    var tipAmount : Double? = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func finishedType(_ sender: UITextField) {
        billAmount = Double(sender.text!)
    }
    
    @IBAction func calculatedTip(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            tipAmount = 0.15
        case 1: tipAmount = 0.2
        case 2: tipAmount = 0.25
        case 3: tipAmount = 0.3
        case 4: tipAmount = 0.5
        default:
            tipAmount = 0.0
        }
        
        if var tip = billAmount {
        tip = billAmount! * tipAmount!
        tipAmt.text = String(format: "$%.2f", tip)
        tipAmt.textColor = .black
    
        let totalAmount : Double = billAmount! + tip
        total.text = String(format: "$%.2f", totalAmount)
        total.textColor = .black
        }
    }
    @IBAction func resetApp(_ sender: UIButton) {
        billAmount = 0.0
        tipAmount = 0.0
        tip.selectedSegmentIndex = 0
        input.text = "0.00"
        tipAmt.text = "$0.00"
        tipAmt.textColor = .gray
        total.text = "$0.00"
        total.textColor = .gray
    }
    

}

