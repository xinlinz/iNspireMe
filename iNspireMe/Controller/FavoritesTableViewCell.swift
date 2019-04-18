//
//  FavoritesTableViewCell.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/18/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    @IBOutlet weak var quotePic: UIImage!
    @IBOutlet weak var quote: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
