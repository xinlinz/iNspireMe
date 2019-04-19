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
    
    @IBOutlet weak var passwordTextField: LoginTextField!
    @IBOutlet weak var usernameTextField: LoginTextField!
    var username = ""
    var password = ""
    
    var curUser: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registerUser(_ sender: Any) {
        self.username = String(usernameTextField.text!)
        self.password = String(passwordTextField.text!)
        let u: User = User(username: username, password: password)
        db.collection("users").document(u.username).setData(u.convertToDictionary())  { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                self.loginUser()
            }
        }
    }
    
    @IBAction func tryLoginUser(_ sender: Any) {
        self.username = String(usernameTextField.text!)
        self.password = String(passwordTextField.text!)
        let docRef = db.collection("users").document(self.username)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:))
                    ?? "nil"
                print("Document data: \(dataDescription)")
                let correctPassword = document.get("password") as! String
                print(correctPassword)
                if (self.password == correctPassword) {
                    print("password correct")
                    self.loginUser()
                    //success = true
                } else {
                    print("Incorrect password")
                    //success = false
                    self.loginFailureAlert()
                }
            } else {
                self.loginFailureAlert()
                print("Username does not exist")
            }
        }
    }
    
    func loginFailureAlert() {
        let alert = UIAlertController(title: "Login Error", message: "The username or password you entered is incorrect. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loginUser() {
        // logs user into their profile page and displays profile page view
        print("loggedin")
        let docRef = db.collection("users").document(username)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:))
                    ?? "nil"
                print("Document data: \(dataDescription)")
                //let username = document.get("username") as! String
                //let password = document.get("password") as! String
                //let profilePic = document.get("profilePic") as! UIImage
                let favoriteQuotes = document.get("favoriteQuotes") as! [Quote]
                let friends = document.get("friends") as! [User]
                let feedPosts = document.get("feedPosts") as! [FeedPost]
                self.curUser = User(username: self.username, password: self.password, favoriteQuotes: favoriteQuotes, friends: friends, feedPosts: feedPosts)
                self.performSegue(withIdentifier: "successLogin", sender: self)
                // TODO: perform segue to user profile
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "successLogin" {
            let profile = segue.destination as! UserProfileViewController
            profile.curUser = self.curUser
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
