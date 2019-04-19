//
//  SecondViewController.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 3/25/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController {
    var selectedMood: String!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //send data to the firebase to get back the enteries.
        db.collection("moods").document(selectedMood)
        
    }


}

