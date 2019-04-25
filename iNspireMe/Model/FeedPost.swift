//
//  FeedPost.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/10/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import Foundation


class FeedPost: Equatable, Hashable {
    
    var user: User
    var time: Date!
    var quote: Quote
    var mood: Mood
    var hashValue: Int {
        return user.username.hashValue ^ time.hashValue
    }
    
    init (user: User, time: Date, quote: Quote, mood: Mood) {
        self.user = user
        self.time = time
        self.quote = quote
        self.mood = mood
    }
    
    static func == (lhs: FeedPost, rhs: FeedPost) -> Bool {
        return lhs.user == rhs.user && lhs.time == rhs.time && lhs.quote == rhs.quote
    }
    
    func convertToDictionary() -> [String: Any] {
        var retDictionary = [String: Any]()
        
        retDictionary["user"] = self.user
        retDictionary["time"] = self.time
        retDictionary["quote"] = self.quote
        retDictionary["mood"] = self.mood
        
        return retDictionary
    }
    
}
