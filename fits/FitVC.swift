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
    
    var image: UIImage?
    
    var index = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = image
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let pageVC = segue.destination as? FitPageVC {
//            pageVC.fitPageVCDelegate = self
//        }
//    }
    
    func setValues(_ image:UIImage, index:Int) {
        
        self.image = image
        self.index = index
    }

    
    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destinationViewController.
//         Pass the selected object to the new view controller.
//    }
   

}


//extension FitVC : FitPageVCDelegate {
//    
//    func pageVCCount(pageVC: FitPageVC, didUpdateCount count: Int) {
//        pageControl.numberOfPages = count
//    }
//    
//    func pageVCIndex(pageVC: FitPageVC, didUpdateIndex index: Int) {
//        pageControl.currentPage = index
//    }
//}
