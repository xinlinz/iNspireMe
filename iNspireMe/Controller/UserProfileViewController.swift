//
//  TableViewController.swift
//  iNspireMe
//
//  Created by Anita Cu on 4/16/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit
import Foundation

class UserProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var toggleButton: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var quote: UILabel!
    
    var curUser: User!
    
    override func viewDidLoad() {
        username.text = curUser.username
        quote.text = curUser.quote
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    // TODO: pass on the current logged in user
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch toggleButton.selectedSegmentIndex {
        case 2:
            return curUser.getFriends().count
        case 1:
            return curUser.getFeedPosts().count
        default:
            return curUser.getFavoriteQuotes().count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 0 = favorites; quote
        // 1 = my posts; date, quote
        // 2 = friends; pic, name, quote
        switch toggleButton.selectedSegmentIndex {
        case 2:
            if let friendCell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as? ProfileTableViewCell {
                let friend = curUser.friends[indexPath.item]
                friendCell.bigText.text = friend.username
                friendCell.smallText.text = friend.quote
                return friendCell
            }
            return UITableViewCell()
        case 1:
            //var sortedFeedPosts = Array(self.feedPosts.keys).sort(<)
            if let postCell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as? ProfileTableViewCell {
                let post = curUser.feedPosts[indexPath.item]
                postCell.smallText.text = post.quote.line
                postCell.date.text = post.time.description
                return postCell
            }
            return UITableViewCell()
        default:
            if let favoritesCell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as? ProfileTableViewCell {
                //cell.feedLabel.text = self.favoriteQuotes[indexPath.item]
                let favorites = curUser.favoriteQuotes[indexPath.item]
                favoritesCell.smallText.text = favorites.line
                return favoritesCell
            }
            return UITableViewCell()
        }
    }
    
}
