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
    var imageURL : URL
    var productImage : [URL]
    var brand : [String]
    var productName : [String]
    var price : [Int]
    var storeName : [String]
    var buyLink : [URL]
    
    init(name:String, text:String, imageURL : URL, productImage : [URL], brand : [String], productName : [String], price : [Int], storeName : [String], buyLink : [URL]) {
        self.name = name
        self.text = text
        self.imageURL = imageURL
        self.productImage = productImage
        self.brand = brand
        self.productName = productName
        self.price = price
        self.storeName = storeName
        self.buyLink = buyLink
        
    }
}
