//
//  User.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/10/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import Foundation
import UIKit
import Firebase

let db = Firestore.firestore()

class User: Equatable {
    var username: String!
    var password: String!
    //var profilePic: UIImage!
    var quote: String!
    var favoriteQuotes = [Quote]()
    var friends = [User]()
    var feedPosts = [FeedPost]()
    
    // Used when registering a User with only username + password
    init(username: String, password: String) {
        self.username = username
        self.password = password // hash?
        //self.profilePic = UIImage(named: "guest.jpg")
    }
    
    // Used to reconstruct an existing User object
    init(username: String, password: String, favoriteQuotes: [Quote], friends: [User], feedPosts: [FeedPost]) {
        self.username = username
        self.password = password
        //self.profilePic = profilePic
        self.favoriteQuotes = favoriteQuotes
        self.friends = friends
        self.feedPosts = feedPosts
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username
    }
    
    func addQuote() {
        // TODO: allow user to add their own quote
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
    
    func getFavoriteQuotes() -> [Quote] {
        return self.favoriteQuotes
    }
//
//    func setProfilePic(pic: UIImage) {
//        self.profilePic = pic
//    }
    
    func addFriend(user: User) {
        if (!self.friends.contains(user)) {
            self.friends.append(user)
        }
    }
    
    func getFriends() -> [User] {
        return self.friends
    }
    
    func makeFeedPost(t: Date, q: Quote) {
        let feedpost: FeedPost = FeedPost(user: self, time: t, quote: q)
        self.feedPosts.append(feedpost)
    }
    
    func getFeedPosts() -> [FeedPost] {
        return self.feedPosts
    }
    
    func convertToDictionary() -> [String: Any] {
        var retDictionary = [String: Any]()
        
        retDictionary["username"] = self.username
        retDictionary["password"] = self.password
        //retDictionary["profilePic"] = self.profilePic
        retDictionary["favoriteQuotes"] = self.favoriteQuotes
        retDictionary["friends"] = self.friends
        retDictionary["feedPosts"] = self.feedPosts
        retDictionary["quote"] = self.quote // FIXME?
        
        return retDictionary
    }
    
}
