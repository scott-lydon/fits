import UIKit
import AVFoundation


class ProductVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func button(_ sender: UIButton) {
        
        self.button.setTitle("Added!", for: UIControlState.normal)

    }
    
    var product : Product?
    
    var index = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        product?.loadImage( completion: { (fetchedImage) in
            DispatchQueue.main.async {
                self.imageView.image = fetchedImage
            }
        })
        
        self.name.text = product?.brandName
        self.text.text = product?.productName
        self.button.setTitle("$ " + "\(product!.price)" + " - Add to Bag", for: UIControlState.normal)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func setValues(product:Product, index : Int) {
        
        self.product = product
        self.index = index
    }
}

