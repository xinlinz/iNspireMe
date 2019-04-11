//
//  Quote.swift
//  iNspireMe
//
//  Created by Xinlin Zhou on 4/10/19.
//  Copyright © 2019 Xinlin Zhou. All rights reserved.
//

import Foundation
import UIKit

class Quote: Equatable {
    var line: String!
    var photo: UIImage!
    
    init (l: String, image: UIImage) {
        self.line = l
        self.photo = image
    }
    
    static func == (lhs: Quote, rhs: Quote) -> Bool {
        return lhs.line == rhs.line
    }
    
    func convertToDictionary() -> [String: Any] {
        var retDictionary = [String: Any]()
        
        retDictionary["line"] = self.line
        retDictionary["photo"] = self.photo
        
        return retDictionary
    }

}
