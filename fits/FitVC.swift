import UIKit
import AVFoundation


class FitVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
   
    @IBOutlet weak var text: UILabel!
    
    @IBOutlet weak var button: UIButton!
        
    var fit : Fit?
    var look : Look?
    var product : Product?
    
    var index = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    
        if index == 0 {
            fit?.loadImage(atURL: (fit?.imageURL)!, completion: { (fetchedImage) in
                DispatchQueue.main.async {
                    self.imageView.image = fetchedImage
                }
            })
            self.name.text = fit?.name
            self.text.text = fit?.text
            self.button.isHidden = true

        } else {
            
            fit?.loadImage(atURL: (fit?.productImage[index-1])!, completion: { (fetchedImage) in
                DispatchQueue.main.async {
                    self.imageView.image = fetchedImage
                }
            })
            self.name.text = fit?.brand[index-1]
            self.text.text = fit?.productName[index-1]
            self.button.setTitle("$ " + "\(fit!.price[index-1])" + " - Add to Bag", for: UIControlState.normal)
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            
        }
    }

    func setValues(fit:Fit, index:Int) {
        
        self.fit = fit
        self.index = index
    }
}

