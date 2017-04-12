//
//  Fit.swift
//  fits
//
//  Created by Vibes on 3/20/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import Foundation
import Contentful

class Fit {
    
    var name : String = ""
    var text : String = ""
    var imageURL : URL?
    var productImage : [URL] = []
    var brand : [String] = []
    var productName : [String] = []
    var price : [Int] = []
    var storeName : [String] = []
    var buyLink : [URL] = []
    var images : [URL: UIImage] = [:]

    private let queue = DispatchQueue(label: "privateQueue", qos: DispatchQoS.background, attributes: .concurrent, autoreleaseFrequency: DispatchQueue.AutoreleaseFrequency.inherit, target: nil)
    
    init(entry: Entry) {
        
        if let name = entry.fields["name"] as? String {
            self.name = name
            
        }
        
        if let text = entry.fields["text"] as? String {
            self.text = text
            
        }
        
        
        if let imageAsset = entry.fields["image"] as? Asset {
            
            if let file = imageAsset.fields["file"] as? [String:Any] {
                
                if let url = file["url"] as? String {
                    
                    let newURL = "https:"+url+"?w=700"
                    
                    if let imageURL = URL(string: newURL) {
                        
                        self.imageURL = imageURL
                        
                    }
                    
                }
            }
        }
        
        if let productImageAssets = entry.fields["productImage"] as? [Asset] {
            
            var productImage : [URL] = []
            
            for asset in productImageAssets {
                
                if let file = asset.fields["file"] as? [String:Any] {
                    
                    if let url = file["url"] as? String {
                        
                        let newURL = "https:"+url+"?w=700"
                        
                        if let productURL = URL(string: newURL) {
                            
                            productImage.append(productURL)
                        }
                        
                    }
                }
            }
            
            self.productImage = productImage
        }
        
        
        if let brand = entry.fields["brand"] as? [String] {
            self.brand = brand
        }
        
        if let productName = entry.fields["productName"] as? [String] {
            self.productName = productName
        }
        
        if let priceString = entry.fields["price"] as? [String] {
            var price = [Int]()
            for string in priceString {
                if let int = Int("\(string)") {
                    price.append(int)
                }
            }
            self.price = price
        }
        
        if let storeName = entry.fields["storeName"] as? [String] {
            self.storeName = storeName
        }
        
        if let buyLinkString = entry.fields["buyLink"] as? [String] {
            var buyLink : [URL] = []
            for link in buyLinkString {
                
                if let linkURL = URL(string: link) {
                    buyLink.append(linkURL)
                }
            }
            
            self.buyLink = buyLink
        }
    }
    
    public func loadImage(atURL url: URL, completion : @escaping (UIImage) -> Void)  {
        queue.async {
            if let image = self.images[url] {
                completion(image)
            } else {
                URLSession.shared.dataTask(with: url, completionHandler: { (data, _, _) in
                    if let newImage = UIImage(data: data!) {
                        self.images[url] = newImage
                        completion(newImage)
                    }
                }).resume()
                if let data = try? Data(contentsOf: url) {
                    if let newImage = UIImage(data: data) {
                        self.images[url] = newImage
                        completion(newImage)
                    }
                }
            }
        }
    }
}
