//
//  Mood.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/10/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import Foundation
class Mood {
    var mood: String!
    var quotes = [Quote]()
    
    init(mood: String){
        self.mood = mood
    }
    
    init(mood: String, quotes: [Quote]){
        self.mood = mood
        self.quotes = quotes
    }
}
