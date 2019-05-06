//
//  Data.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/25/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import Foundation

class Data {
    let q1: Quote!
    let q2: Quote!
    let q3: Quote!
    let q4: Quote!
//
//    let mood: Mood!
//    var p1: FeedPost!
//    var p2: FeedPost!
//    var p3: FeedPost!
    
    init() {
        q1 = Quote(l: "q1")
        q2 = Quote(l: "q2")
        q3 = Quote(l: "q3")
        q4 = Quote(l: "q4")
//        mood = Mood(mood: "angry")
//        p1 = FeedPost(user: User(username: "Mallory", password: "Mallory"), time: Date(), quote: q1, mood: mood)
//        p2 = FeedPost(user: User(username: "Mallory", password: "Mallory"), time: Date(), quote: q2, mood: mood)
//        p3 = FeedPost(user: User(username: "Mallory", password: "Mallory"), time: Date(), quote: q3, mood: mood)
//
        
        let m1 = Mood(mood: "happy", quotes: [q1.hashValue, q2.hashValue])
        let m2 = Mood(mood: "sad", quotes: [q3.hashValue, q4.hashValue])

        db.collection("moods").document("happy").setData(m1.convertToDictionary(), merge: true)  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        db.collection("moods").document("sad").setData(m2.convertToDictionary(), merge: true)  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        db.collection("quotes").document(String(q1.hashValue)).setData(q1.convertToDictionary(), merge: true)  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        db.collection("quotes").document(String(q2.hashValue)).setData(q2.convertToDictionary(), merge: true)  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        
        db.collection("quotes").document(String(q3.hashValue)).setData(q3.convertToDictionary(), merge: true)  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
        db.collection("quotes").document(String(q4.hashValue)).setData(q4.convertToDictionary(), merge: true)  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    
        
//        print("line74")
//        db.collection("feed posts").document(String(p1.hashValue)).setData(p1.convertToDictionary(), merge: true)  { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//        print("line82")
//        db.collection("feed posts").document(String(p2.hashValue)).setData(p2.convertToDictionary(), merge: true)  { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
//
//        db.collection("feed posts").document(String(p3.hashValue)).setData(p3.convertToDictionary(), merge: true)  { err in
//            if let err = err {
//                print("Error writing document: \(err)")
//            } else {
//                print("Document successfully written!")
//            }
//        }
        
        
        
        
        
    }
    
}


