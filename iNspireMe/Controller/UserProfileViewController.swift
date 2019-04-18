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
    
    // TODO: pass on the current logged in user
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch toggleButton.selectedSegmentIndex {
        case 2:
            return 1
            //return self.friends.count
        case 1:
            return 2
            //return self.feedPosts.count
        default:
            return 3
            //return self.favoriteQuotes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 0 = favorites; quote
        // 1 = my posts; date, quote
        // 2 = friends; pic, name, quote
        switch toggleButton.selectedSegmentIndex {
        case 2:
            if let friendCell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as? FriendTableViewCell {
                //cell.feedLabel.text = self.friends[indexPath.item]
                return friendCell
            }
            return UITableViewCell()
        case 1:
            //var sortedFeedPosts = Array(self.feedPosts.keys).sort(<)
            if let postCell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as? PostTableViewCell {
                //cell.feedLabel.text = sortedFeedPosts[indexPath.item]
                 return postCell
            }
            return UITableViewCell()
        default:
            if let favoritesCell = tableView.dequeueReusableCell(withIdentifier: "profileTableCell", for: indexPath) as? FavoritesTableViewCell {
                //cell.feedLabel.text = self.favoriteQuotes[indexPath.item]
                return favoritesCell
            }
            return UITableViewCell()
        }
    }
    
}
