//
//  FeedPost.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/10/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import Foundation

class FeedPost {
    var user: User
    var time: Date!
    var quote: Quote
    
    init (user: User, time: Date, quote: Quote) {
        self.user = user
        self.time = time
        self.quote = quote
    }
}
