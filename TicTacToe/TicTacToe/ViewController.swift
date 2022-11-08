//
//  ViewController.swift
//  TicTacToe
//
//  Created by Putti, Sri Vamsi K on 10/6/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var restartButton: UIButton!
    @IBOutlet var labelMain: UILabel!
    var game : [Int] = [0, 0, 0,
                        0, 0, 0,
                        0, 0, 0 ]
    var turn = true
    var ended = false
    var gameWon = false
    override func viewDidLoad() {
        super.viewDidLoad()
        restartButton.setTitle("Restart", for: .normal)
        // Do any additional setup after loading the view.
        for index in 0..<buttons.count {
            buttons[index].tag = index
            buttons[index].backgroundColor = .gray
            buttons[index].setTitle("", for: .normal)
        }
        labelMain.text = "Red Turn"
        labelMain.textAlignment = .center
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        if(!gameWon && game[sender.tag] == 0) {
            if turn {
                buttons[sender.tag].backgroundColor = .red
                turn = false
                game[sender.tag] = 1
                labelMain.text = "Blue Turn"
            }
            else if !turn {
                buttons[sender.tag].backgroundColor = .blue
                turn = true
                game[sender.tag] = 2
                labelMain.text = "Red Turn"
            }
        
        
        if game[0] == 1 && game[1] == 1 && game[2] == 1 || game[3] == 1 && game[4] == 1 && game[5] == 1 || game[6] == 1 && game[7] == 1 && game[8] == 1 {
            labelMain.text = "YOU WIN"
            restartButton.setTitle("Go again?", for: .normal)
            gameWon = true
            view.addSubview(labelMain)
        }
        else if game[0] == 2 && game[1] == 2 && game[2] == 2 || game[3] == 2 && game[4] == 2 && game[5] == 2 || game[6] == 2 && game[7] == 2 && game[8] == 2 {
            labelMain.text = "YOU WIN"
            restartButton.setTitle("Go again?", for: .normal)
            gameWon = true
            view.addSubview(labelMain)
            }
        else if game[0] == 2 && game[3] == 2 && game[6] == 2 || game[1] == 2 && game[4] == 2 && game[7] == 2 || game[2] == 2 && game[5] == 2 && game[8] == 2 {
            labelMain.text = "YOU WIN"
            restartButton.setTitle("Go again?", for: .normal)
            gameWon = true
            view.addSubview(labelMain)
            }
        else if game[0] == 1 && game[3] == 1 && game[6] == 1 || game[1] == 1 && game[4] == 1 && game[7] == 1 || game[2] == 1 && game[5] == 1 && game[8] == 1 {
            labelMain.text = "YOU WIN"
            restartButton.setTitle("Go again?", for: .normal)
            gameWon = true
            view.addSubview(labelMain)
            }
        else if game[0] == 1 && game[4] == 1 && game[8] == 1 || game[2] == 1 && game[4] == 1 && game[6] == 1  {
            labelMain.text = "YOU WIN"
            restartButton.setTitle("Go again?", for: .normal)
            gameWon = true
            view.addSubview(labelMain)
            }
        else if game[0] == 2 && game[4] == 2 && game[8] == 2 || game[2] == 2 && game[4] == 2 && game[6] == 2  {
            labelMain.text = "YOU WIN"
            restartButton.setTitle("Go again?", for: .normal)
            gameWon = true
            view.addSubview(labelMain)
            }
        else {
            var check = true
            for index in 0..<game.count {
                if(game[index] == 0) {
                    check = false
                    break
                }
            }
            if(check) {
                labelMain.text = "IT'S A DRAW!!!"
                restartButton.setTitle("Go again?", for: .normal)
                gameWon = true
                view.addSubview(labelMain)
            }
        }
        }
    }
    
    
    @IBAction func restartPressed(_ sender: UIButton) {
        for index in 0..<buttons.count {
            buttons[index].tag = index
            buttons[index].backgroundColor = .gray
            buttons[index].setTitle("", for: .normal)
        }
        for index in 0..<game.count {
            game[index] = 0
        }
        turn = true
        gameWon = false
        labelMain.text = "Red Turn"
        restartButton.setTitle("Restart", for: .normal)
    }
}
    


