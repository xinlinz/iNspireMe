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
    var allQuotesArray = [Quote]()
    
    @IBOutlet weak var quotesScrollView: UIScrollView!
    
    @IBOutlet weak var quotePicture: UIImageView!
    
    @IBOutlet weak var quoteText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //send data to the firebase to get back the enteries.
        self.getDataForMood()
        self.displayStuff()
    }
    
    func getDataForMood() {
        let docRef = db.collection("moods").document(selectedMood)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.allQuotesArray = document.get("quotes") as! [Quote]
            }
        }
    }
    
    func displayStuff() {
        for i in 0..<self.allQuotesArray.count {
//            let imageView = UIImageView()
//            let x = self.view.frame.size.width * CGFloat(i)
//            imageView.frame = CGRect(x: x, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//            imageView.contentMode = .scaleAspectFit
            self.quotePicture.image = self.allQuotesArray[i].photo
            self.quoteText.text = self.allQuotesArray[i].line
            
//            scrollView.contentSize.width = scrollView.frame.size.width * CGFloat(i + 1)
            self.quotesScrollView.addSubview(self.quotePicture)
            self.quotesScrollView.addSubview(self.quoteText)
        }
    }
}

