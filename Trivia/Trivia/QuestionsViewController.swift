//
//  QuestionsViewController.swift
//  Trivia
//
//  Created by Putti, Sri Vamsi K on 2/7/22.
//

import UIKit

class QuestionsViewController: UIViewController {
    var numQuestions = 0
    var numCorrect = 0
    var currCategory = ""
    var qBank : [String: [Trivia]] = [:]
    var questions : [Trivia] = []
    @IBOutlet var progress: UIProgressView!
    var currQuestion = Trivia(q: "", correct: "", incorrect: [""])
    @IBOutlet var question: UILabel!
    var counter = 0
    @IBOutlet var choices: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   // Do any additional setup after loading the view.
        questions = findArray(parsed: currCategory)
        currQuestion = setCurrQuestionScreen(bank: questions)
        counter+=1
    }
    
    func findArray(parsed: String) -> [Trivia] {
        var temp : [Trivia] = []
        for category in qBank.keys {
            if category.contains(parsed) {
                temp = qBank[category]!
            }
        }
        
        return temp
            
    }
    
    func setCurrQuestionScreen(bank: [Trivia]) -> Trivia {
        var randQ = bank.randomElement()!
        questions.remove(at: removeQ(q: randQ))
        question.text = randQ.q
        progress.progress = Float(Double(counter)/Double(numQuestions))
        var temp : [String] = randQ.getChoices()
        for choice in choices {
            choice.backgroundColor = .white
        }
        choices[0].setTitle(temp[0], for: .normal)
        choices[1].setTitle(temp[1], for: .normal)
        choices[2].setTitle(temp[2], for: .normal)
        choices[3].setTitle(temp[3], for: .normal)
        return randQ
    }
    
    func findCorrectButton(q: Trivia) -> UIButton? {
        var correctChoice = q.correct
        for choice in choices  {
            if choice.titleLabel?.text == correctChoice {
                return choice
            }
        }
        return nil
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if findCorrectButton(q: currQuestion) == sender  && counter < numQuestions {
            UIView.animate(withDuration: 1.5, animations: {
                sender.backgroundColor = .green
            }, completion: { finished in
                self.currQuestion = self.setCurrQuestionScreen(bank: self.questions)
                self.counter+=1
                self.numCorrect+=1
            })
        }
        else if findCorrectButton(q: currQuestion) != sender && counter < numQuestions {
            UIView.animate(withDuration: 1.5, animations: {
                sender.backgroundColor = .red
                self.findCorrectButton(q: self.currQuestion)?.backgroundColor = .green
            }, completion: { finished in
                self.currQuestion = self.setCurrQuestionScreen(bank: self.questions)
                self.counter+=1
            })
        } else if counter >= numQuestions {
            if findCorrectButton(q: currQuestion) == sender {
                UIView.animate(withDuration: 1.5, animations: {
                    sender.backgroundColor = .green
                }, completion: { finished in
                    
                    self.counter+=1
                    self.numCorrect+=1
                    self.performSegue(withIdentifier: "Score", sender: nil)
                })
            }
            else if findCorrectButton(q: currQuestion) != sender {
                UIView.animate(withDuration: 1.5, animations: {
                    sender.backgroundColor = .red
                    self.findCorrectButton(q: self.currQuestion)?.backgroundColor = .green
                }, completion: { finished in
                    
                    self.counter+=1
                    self.performSegue(withIdentifier: "Score", sender: nil)
                })
           
            }
            
        }
        
    }
    
    func removeQ(q: Trivia) -> Int {
        var idx = 0
        for question in questions {
            idx+=1
            if question.q == q.q {
             break
            }
        }
        return idx
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ScoreViewController {
            let vc = segue.destination as? ScoreViewController
            vc?.numQuestions = numQuestions
            vc?.questionsAnsweredCorrectly = numCorrect
        }
    }
    
    
    
    
    

}
