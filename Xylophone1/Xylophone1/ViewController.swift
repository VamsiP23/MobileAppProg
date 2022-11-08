//
//  ViewController.swift
//  Xylophone1
//
//  Created by Putti, Sri Vamsi K on 11/8/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    var player : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(String(sender.currentTitle!))
    }
    
    func playSound(_ sender : String) {
        let url = Bundle.main.url(forResource: sender, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}

