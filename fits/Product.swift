//
//  Product.swift
//  fits
//
//  Created by Vibes on 4/12/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import Foundation

class Product {
    
    var productImage : URL
    var brandName : String
    var productName : String
    var price : Double
    var tags : [String] = []
    var lookID : String
    
    init(productImage : String, brandName : String, productName : String, price: Double, lookID : String) {
        
        self.productImage = URL(string: productImage)!
        self.brandName = brandName
        self.productName = productName
        self.price = price 
        self.lookID = lookID
        
    }
}
