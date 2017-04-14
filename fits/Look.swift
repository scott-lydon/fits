//
//  Look.swift
//  fits
//
//  Created by Vibes on 4/12/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import Foundation

class Look {
    
    var celebrityID : String
    var description : String
    var imageURL : String
    var postedByUserID : String
    var productIDs : [String]
//    var images : [URL: UIImage] = [:]

    
    init( celebrityID : String, description : String , imageURL : String, postedByUserID : String, productIDs : [String]) {
        
        self.celebrityID = celebrityID
        self.description = description
        self.imageURL = imageURL
        self.postedByUserID = postedByUserID
        self.productIDs = productIDs
    }
    
//    public func loadImage(atURL url: URL, completion : @escaping (UIImage) -> Void)  {
//        queue.async {
//            if let image = self.images[url] {
//                completion(image)
//            } else {
//                URLSession.shared.dataTask(with: url, completionHandler: { (data, _, _) in
//                    if let newImage = UIImage(data: data!) {
//                        self.images[url] = newImage
//                        completion(newImage)
//                    }
//                }).resume()
//                if let data = try? Data(contentsOf: url) {
//                    if let newImage = UIImage(data: data) {
//                        self.images[url] = newImage
//                        completion(newImage)
//                    }
//                }
//            }
//        }
//    }
}
