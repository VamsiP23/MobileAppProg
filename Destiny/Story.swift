//
//  Story.swift
//  Destiny
//
//  Created by Putti, Sri Vamsi K on 9/16/21.
//  Copyright © 2021 Putti, Sri Vamsi K. All rights reserved.
//

import Foundation
struct Story {
    let title : String
    let choice1 : String
    let choice1Index : Int
    let choice2 : String
    let choice2Index : Int
    
    init(title : String, choice1 : String, choice1Index : Int, choice2 : String, choice2Index : Int) {
        self.title = title
        self.choice1 = choice1
        self.choice1Index = choice1Index
        self.choice2 = choice2
        self.choice2Index = choice2Index
    }
}
