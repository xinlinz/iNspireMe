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
    
//    let data = Data()
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
        let q1 = Quote(l: "q1")
        let q2 = Quote(l: "q2")
        let q3 = Quote(l: "q3")
        let mood = Mood(mood: "angry")
        let p1 = FeedPost(user: User(username: "Mallory", password: "Mallory"), time: Date(), quote: q1, mood: mood)
        let p2 = FeedPost(user: User(username: "Mallory", password: "Mallory"), time: Date(), quote: q2, mood: mood)
        let p3 = FeedPost(user: User(username: "Mallory", password: "Mallory"), time: Date(), quote: q3, mood: mood)
        self.feedPosts = [p1, p2, p3]
//        self.feedPosts = [data.p1, data.p2, data.p3]
        // Do any additional setup after loading the view, typically from a nib.
        //send data to the firebase to get back the enteries.
//        db.collection("feed posts").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
//                    let userHash = document.get("user")
//                    let time = document.get("time")
//                    let quoteHash = document.get("quote")
//                    let moodhash = document.get("mood")
//                    let feedPost = self.findHashInfo(userHash: userHash as! String, quoteHash: quoteHash as! String, moodHash: moodhash as! String, time: time as! Date)
//                    self.feedPosts.append(feedPost)
//                }
//            }
//        }
        
    }
    
//    func findHashInfo(userHash: String, quoteHash: String, moodHash: String, time: Date) -> FeedPost {
//        var user: User? = nil
//        var quote: Quote? = nil
//        var mood: Mood? = nil
//
//        let userDocRef = db.collection("users").document(userHash)
//        userDocRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                user = document
//                // TODO: perform segue to user profile
//
//            }
//
//        let quoteDocRef = db.collection("quotes").document(quoteHash)
//        db.collection("quotes").getDocuments(source: quoteHash) { (quoteCollection, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in quoteCollection!.documents {
//                    quote = document.get(quoteHash) as? Quote
//                }
//            }
//        }
//
//        db.collection("moods").getDocuments(moodHash) { (quoteCollection, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in quoteCollection!.documents {
//                    mood = document.get(quoteHash) as? Mood
//                }
//            }
//        }
//
//        let feedPost = FeedPost(user: user as! User, time: time , quote: quote as! Quote, mood: mood as! Mood)
//        return feedPost
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        curUser = UserProfileViewController.user
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feedPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let feedPostCell = tableView.dequeueReusableCell(withIdentifier: "socialFeedPost", for: indexPath) as? SocialFeedViewCell {
            
            feedPostCell.date.text = self.feedPosts[indexPath.item].time.description
            feedPostCell.quote.text = self.feedPosts[indexPath.item].quote.line
            feedPostCell.username.text = self.feedPosts[indexPath.item].user.username
            
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
