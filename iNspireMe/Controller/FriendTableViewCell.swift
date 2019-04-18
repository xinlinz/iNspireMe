//  TableViewCell.swift
//  iNspireMe
//
//  Created by Anita Cu on 4/16/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit
import Foundation

class FriendTableViewCell: UITableViewCell {
    
    // cell contains pic, name, quote
    
    @IBOutlet weak var friendPic: UIImage!
    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var friendQuote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
