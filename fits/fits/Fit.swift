//
//  Fit.swift
//  fits
//
//  Created by Vibes on 3/20/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import Foundation

class Fit {
    
    var name : String
    var text : String
    var items : [Item]
    var imageURL : URL
    
    init(name:String, text:String, items:[Item], imageURL : URL) {
        self.name = name
        self.text = text
        self.items = items
        self.imageURL = imageURL
    }
}
