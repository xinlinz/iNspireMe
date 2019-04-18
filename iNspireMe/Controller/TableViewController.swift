//
//  TableViewController.swift
//  iNspireMe
//
//  Created by Anita Cu on 4/16/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch toggleButton.selectedSegmentIndex {
        case 2:
            return self.friends.count
        case 1:
            return self.feedPosts.count
        default:
            return self.favoriteQuotes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch toggleButton.selectedSegmentIndex {
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? TableViewCell {
                cell.feedLabel.text = self.friends[indexPath.item]
                return cell
            }
            return UITableViewCell()
        case 1:
            var sortedFeedPosts = Array(self.feedPosts.keys).sort(<)
            if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? TableViewCell {
                cell.feedLabel.text = sortedFeedPosts[indexPath.item]
                return cell
            }
            return UITableViewCell()
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? TableViewCell {
                cell.feedLabel.text = self.favoriteQuotes[indexPath.item]
                return cell
            }
            return UITableViewCell()
        }
    }
    
}
