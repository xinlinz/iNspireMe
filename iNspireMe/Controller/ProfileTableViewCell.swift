//
//  ProfileTableViewCell.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/18/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var pic: UIImage!
    @IBOutlet weak var bigText: UILabel!
    @IBOutlet weak var smallText: UITextField!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bigText.text = ""
        smallText.text = ""
        date.text = ""
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
