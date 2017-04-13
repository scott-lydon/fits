//
//  Firebase.swift
//  fits
//
//  Created by Vibes on 4/12/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class Firebase {
    
    var ref: FIRDatabaseReference = FIRDatabase.database().reference()
    
    static let shared = Firebase()
    
    func getProduct(productID : String)  {
        
        let address = ref.child("product").child(productID)
        
        address.observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let dict = snapshot.value as? [String:Any] else { return }
                
            guard let imageURL = dict["imageURL"] as? String else { return }
            guard let brandName = dict["brandName"] as? String else { return }
            guard let productName = dict["productName"] as? String else { return }
            guard let price = dict["price"] as? Double else { return }
            guard let lookID = dict["lookID"] as? String else { return }
            
            var product = Product(productImage: imageURL, brandName: brandName, productName: productName, price: price, lookID: lookID)
           
        })
        
    }
    
   
    
    //self.ref.child("RestaurantReviews").child("restaurants").child("4545").child("location").setValue("New Jersey")

    

    
    
}
