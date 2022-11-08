//
//  ViewController.swift
//  RainbowTabs
//
//  Created by Putti, Sri Vamsi K on 1/28/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarItem.badgeValue = "!"     

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
     
        tabBarItem.badgeValue = nil
    }


}

