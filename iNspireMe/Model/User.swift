//
//  User.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/10/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import Foundation
import UIKit

class User: Equatable {
    var username: String!
    var password: String!
    var profilePic: UIImage!
    var favoriteQuotes = [Quote]()
    var friends = [User]()
    var feedPosts = [Date: FeedPost]()
    
    init(u: String, p: String) {
        self.username = u
        self.password = p // hash?
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username
    }
    
    func addFavoriteQuote(q: Quote) {
        if (!self.favoriteQuotes.contains(q)) {
            self.favoriteQuotes.append(q)
        }
    }
    
    func removeFavoriteQuote(q: Quote) {
        if let index = self.favoriteQuotes.index(of:q) {
            self.favoriteQuotes.remove(at: index)
        }
    }
    
    func setProfilePic(pic: UIImage) {
        self.profilePic = pic
    }
    
    func addFriend(user: User) {
        if (!self.friends.contains(user)) {
            self.friends.append(user)
        }
    }
    
    func makeFeedPost(t: Date, q: Quote) {
        let feedpost: FeedPost = FeedPost(user: self, time: t, quote: q)
        self.feedPosts[t] = feedpost
    }

    
    
}
