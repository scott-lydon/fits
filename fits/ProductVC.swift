import UIKit
import AVFoundation


class ProductVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    var product : Product?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //            look?.loadImage(atURL: (look?.imageURL)!, completion: { (fetchedImage) in
        //                DispatchQueue.main.async {
        //                    self.imageView.image = fetchedImage
        //                }
        //            })
        self.name.text = product?.brandName
        self.text.text = product?.productName
        self.button.setTitle("$ " + "\(product!.price)" + " - Add to Bag", for: UIControlState.normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func setValues(product:Product) {
        
        self.product = product
    }
}

