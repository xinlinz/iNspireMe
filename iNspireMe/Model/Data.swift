//
//  Data.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/25/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import Foundation

class Data {
    init() {
        let q1 = Quote(l: "q1")
        let q2 = Quote(l: "q2")
        let q3 = Quote(l: "q3")
        let q4 = Quote(l: "q4")
        
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
        
    }
    
}


