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
    
    fileprivate var _authHandle: FIRAuthStateDidChangeListenerHandle!
    
    fileprivate var _refHandle: FIRDatabaseHandle!
    
    var user: FIRUser?
    
    static let shared = Firebase()
    
    // USER STUFF
    

    // GET STUFF
    
    func getProducts(productIDs : [String], completion : @escaping ([Product]) -> Void) {
        
        var products : [Product] = []
        
        let address = ref.child("product")
        
        address.observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let dict = snapshot.value as? [String:Any] else { return }
            
            for product in productIDs {
                
                guard let prod = dict[product] as? [String:Any] else {return}
                
                guard let brandName = prod["brandName"] as? String else { return }
                guard let lookID = prod["lookID"] as? String else { return }
                guard let price = prod["price"] as? Double else { return }
                guard let imageURL = prod["imageURL"] as? String else { return }
                guard let productName = prod["productName"] as? String else { return }
                
                let product = Product(productImage: imageURL, brandName: brandName, productName: productName, price: price, lookID: lookID)
                
                products.append(product)
                
            }
            
            completion(products)
            
        })
        
    }
    
    func getLooks(completion : @escaping ([Look]) -> Void)  {
        
        var looks : [Look] = []
        
        let address = ref.child("look")
        
        address.observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let dict = snapshot.value as? [String:Any] else { return }
            
            for (key,_) in dict {
                
                guard let lookDict = dict[key] as? [String:Any] else { return }
                guard let imageURL = lookDict["imageURL"] as? String else { return }
                guard let postedByUserID = lookDict["postedByUserID"] as? String else { return }
                guard let description = lookDict["description"] as? String else { return }
                guard let celebrityID = lookDict["celebrityID"] as? String else { return }
                guard let productIDs = lookDict["productIDs"] as? [String] else { return }
                
                let look = Look(celebrityID: celebrityID, description: description, imageURL: imageURL, postedByUserID: postedByUserID, productIDs: productIDs)
                
                looks.append(look)
                
            }
            
            completion(looks)
        })
        
    }
    
    // ADD TO CART / FAVORITES
    
    
    //self.ref.child("RestaurantReviews").child("restaurants").child("4545").child("location").setValue("New Jersey")
    

    
}
