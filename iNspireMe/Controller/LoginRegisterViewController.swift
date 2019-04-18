//
//  UserProfileViewController.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/10/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit
import Firebase

class LoginRegisterViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var username = ""
    var password = ""
    
    //var profilePic: UIImage = UIImage
    var favoriteQuotes: [Quote] = [Quote]()
    var feedPosts: [Date: FeedPost] = [Date: FeedPost]()
    var friends: [User] = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username = String(usernameTextField.text!)
        password = String(passwordTextField.text!)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registerUser(_ sender: Any) {
        let u: User = User(username: username, password: password)
        
        db.collection("users").document(u.username).setData(u.convertToDictionary())  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    @IBAction func tryLoginUser(_ sender: Any) {
        if (checkLogin(username: username, password: password)) {
            loginUser()
        } else {
            // failed to login user b/c username does not exist or incorrect password
            // maybe print out a message later
        }
    }
    
    func loginFailureAlert() {
        let alert = UIAlertController(title: "Login Error", message: "The username or password you entered is incorrect. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkLogin(username: String, password: String) -> Bool {
        
        let docRef = db.collection("users").document(username)
        
        var success = false
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:))
                    ?? "nil"
                print("Document data: \(dataDescription)")
                let correctPassword = document.get("password") as! String
                if (password == correctPassword) {
                    success = true
                } else {
                    print("Incorrect password")
                    success = false
                }
            } else {
                print("Username does not exist")
            }
        }
        return success
    }
    
    func loginUser() {
        // logs user into their profile page and displays profile page view
        let docRef = db.collection("users").document(username)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:))
                    ?? "nil"
                print("Document data: \(dataDescription)")
                //let username = document.get("username") as! String
                //let password = document.get("password") as! String
                let profilePic = document.get("profilePic") as! UIImage
                self.favoriteQuotes = document.get("favoriteQuotes") as! [Quote]
                self.friends = document.get("friends") as! [User]
                self.feedPosts = document.get("feedPosts") as! [Date: FeedPost]
                //user = User(username: username, password: password, profilePic: profilePic, favoriteQuotes: favoriteQuotes, friends: friends, feedPosts: feedPosts)
                
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
