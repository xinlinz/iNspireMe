//
//  SocialFeedViewController.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/24/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit
import Firebase

import UIKit
import Firebase

class SocialFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var moods = ["happy", "angry", "confused", "inspired", "sad"]
    
    var feedPosts: [FeedPost] = []
    //let db = Firestore.firestore()
    
    @IBOutlet weak var makePostQuoteLineLabel: UITextField!
    @IBOutlet weak var makePostQuotePhotoLabel: UIImage!
    @IBOutlet weak var makePostMoodsLabel: UITextField!
    @IBOutlet weak var feedTableView: UITableView!
    
    var curUser: User!
    var makePostQuote: Quote!
    var makePostMood: Mood!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //send data to the firebase to get back the enteries.
        db.collection("feed posts").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let user = document.get("user")
                    let time = document.get("time")
                    let quote = document.get("quote")
                    let mood = document.get("mood")
                    let feedPost = FeedPost(user: user as! User, time: time as! Date, quote: quote as! Quote, mood: mood as! Mood)
                    self.feedPosts.append(feedPost)
                }
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        curUser = UserProfileViewController.user
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let feedPostCell = tableView.dequeueReusableCell(withIdentifier: "socialFeedPost", for: indexPath) as? SocialFeedViewCell {
            return feedPostCell
        }
        return UITableViewCell()
    }
    
    @IBAction func makePost() {
        
        let line = String(makePostQuoteLineLabel.text!)
        //let image = makePostQuotePhotoLabel as UIImage
        self.makePostQuote = Quote(l: line)
        
        let moodAsString = String(makePostMoodsLabel.text!)
        
        if (self.curUser == nil) {
            print("Cannot make post if not logged in (or not all fields filled in).")
        }
        
        var newFeedPost: FeedPost!
        
        if (self.moods.contains(moodAsString)) {
            
            /*docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    print("line86")
                    //let quotes = document.get("quotes") as! [Int]
                    //print(quotes.description)
                    //self.makePostMood = Mood(mood: moodAsString, quotes: quotes)
                    self.makePostMood = Mood(mood: moodAsString)
                    post = FeedPost(user: self.curUser, time: Date(), quote: self.makePostQuote, mood: self.makePostMood)
                    print("created post")
                } else {
                    print("lined90")
                }
            }*/
            newFeedPost = makeFeedPost(moodAsString: moodAsString)
            print("line94")
        } else {
            print("Mood category could not be found.")
        }
        
        newFeedPost = makeFeedPost(moodAsString: moodAsString)
        
        if (newFeedPost != nil) {
            print("is nil")
            return
        }
        
        print("got the post")
        
        /*if (self.moods.contains(moodAsString)) {
            print("here81")
            let docRef = db.collection("moods").document(moodAsString)
            print(docRef.path)
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    print("line86")
                    let quotes = document.get("quotes") as! [Int]
                    print(quotes.description)
                    self.makePostMood = Mood(mood: moodAsString, quotes: quotes)
                    newFeedPost = FeedPost(user: self.curUser, time: Date(), quote: self.makePostQuote, mood: self.makePostMood)
                } else {
                    print("lined90")
                }
            }
            print("line94")
        } else {
            print("Mood category could not be found.")
        }*/
        
        //print(self.curUser)
        //print(Date())
        //print(self.makePostQuote)
        //print(self.makePostMood)
        
//        let newFeedPost = FeedPost(user: self.curUser, time: Date(), quote: self.makePostQuote, mood: self.makePostMood)
        
        // write to DB
        db.collection("feed posts").document(String(newFeedPost.hashValue)).setData(newFeedPost.convertToDictionary())  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Post successfully made!")
            }
        }
        
        self.feedPosts.append(newFeedPost)
    }
    
    func makeFeedPost(moodAsString: String) -> FeedPost? {
        
        var post: FeedPost? = nil
        
        print("here81")
        let docRef = db.collection("moods").document(moodAsString)
        print(docRef.path)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                print("line86")
                //let quotes = document.get("quotes") as! [Int]
                //print(quotes.description)
                //self.makePostMood = Mood(mood: moodAsString, quotes: quotes)
                self.makePostMood = Mood(mood: moodAsString)
                post = FeedPost(user: self.curUser, time: Date(), quote: self.makePostQuote, mood: self.makePostMood)
                print("created post")
            } else {
                print("lined90")
            }
        }
        return post
    }
    
}
