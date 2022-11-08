//
//  Destiny.swift
//  Destiny
//
//  Created by Putti, Sri Vamsi K on 9/16/21.
//  Copyright © 2021 Putti, Sri Vamsi K. All rights reserved.
//

import Foundation
struct Destiny {
    var currentStory : Int = 0
    let stories = [
    //construct Story objects inside the list
        Story(title: "There are 2.5 seconds left on the clock. You are down by two points. What do you do?", choice1: "Shoot the 3 because your Steph Curry", choice1Index: 1, choice2: "Go for layup and play Overtime", choice2Index: 4),
        Story(title: "You are passed the ball at the top of the key, but your defender is tightly guarding you. What do you do?", choice1: "Trust yourself, and step back and shoot cause its DAME TIME", choice1Index: 2, choice2: "Pass to your open teamate on the right wing", choice2Index: 3),
        Story(title: "You shoot the shot, but you airball. It was a difficult shot though.", choice1: "Run it back?", choice1Index: 0, choice2: "Get 'em next time.", choice2Index: 0),
        Story(title: "You pass the ball to your teamate, who pumpfakes and then shoots the ball. HE MAKES IT!!! Guess basketball is a team sport.", choice1: "NICE W", choice1Index: 0, choice2: "#1 Victory Royale", choice2Index: 0),
        Story(title: "You are passed the ball at the top of the key and you want to send it to overtime. Your defender is guarding you tightly. What do you do?", choice1: "Hesi to the right, between the legs, and crossover", choice1Index: 5, choice2: "Drive right and push back the defender with your strength", choice2Index: 5),
        Story(title: "You break your defender's ankles and you see a free mid-range. However, you are bad at mid range shots and would prefer to lay it up, but their center is 7 ft getting ready to jump. What do you do?", choice1: "Pull up for the mid-range, as the shot always goes in after you take ankles.", choice1Index: 6, choice2: "Go for the jam over the 7 ft center.", choice2Index: 6),
        Story(title: "ITS GOOD!!! You send the game to overtime and blow them out!!!", choice1: "One more time?", choice1Index: 0, choice2: "W", choice2Index: 0),
    ]
    
    func getTitle() -> String {
        return stories[currentStory].title
    }
    func getChoice1() -> String {
        return stories[currentStory].choice1
    }
    func getChoice2() -> String {
        return stories[currentStory].choice2
    }
}
