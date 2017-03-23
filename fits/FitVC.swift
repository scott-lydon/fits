//
//  FitVC.swift
//  fits
//
//  Created by Vibes on 3/20/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import UIKit

class FitVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
   
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var price: UILabel!
    
    
    
    var fit : Fit?
    
    var index = 0
    
    private func loadImage(atURL url: URL) -> UIImage? {
        
        if let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        
        return nil
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    
        if index == 0 {
            
            self.imageView.image = loadImage(atURL: (fit?.imageURL)!)
            self.name.text = fit?.name
            self.text.text = fit?.text
            self.price.text = " "
            self.button.isHidden = true

        } else {
            
            self.imageView.image = loadImage(atURL: (fit?.productImage[index-1])!)
            self.name.text = fit?.brand[index-1]
            self.text.text = fit?.productName[index-1]
            self.price.text = "$ " + "\(fit!.price[index-1])"
            self.button.setTitle("Buy at " + (fit?.storeName[index-1])!, for: UIControlState.normal)
            button.layer.cornerRadius = 5
            
        }
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setValues(fit:Fit, index:Int) {
        
        self.fit = fit
        self.index = index
    }

    
    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
//    }
   

}

