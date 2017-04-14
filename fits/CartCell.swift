//
//  CartCell.swift
//  fits
//
//  Created by Vibes on 4/11/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    
    var product : Product?

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var brandName: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.brandName.text = product?.brandName
        self.price.text = "\(product?.price)" ?? "0"
        self.productName.text = product?.productName
        
        product?.loadImage( completion: { (fetchedImage) in
            DispatchQueue.main.async {
                self.productImage.image = fetchedImage
            }
        })
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
