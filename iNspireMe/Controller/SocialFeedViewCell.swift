//
//  SocialFeedViewCell.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/24/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit

class SocialFeedViewCell: UITableViewCell {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var quote: UITextField!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
