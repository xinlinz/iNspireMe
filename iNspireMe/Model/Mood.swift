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
    var quotes = [Int]()
    
    init(mood: String){
        self.mood = mood
    }
    
    init(mood: String, quotes: [Int]){
        self.mood = mood
        self.quotes = quotes
    }
    
    func convertToDictionary() -> [String: Any] {
        var retDictionary = [String: Any]()
        
        retDictionary["quotes"] = self.quotes
        
        return retDictionary
    }
    
}
