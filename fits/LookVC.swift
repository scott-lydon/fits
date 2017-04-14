import UIKit
import AVFoundation


class LookVC: UIViewController, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var text: UILabel!
    
    
    var look : Look?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
//            look?.loadImage(atURL: (look?.imageURL)!, completion: { (fetchedImage) in
//                DispatchQueue.main.async {
//                    self.imageView.image = fetchedImage
//                }
//            })
            self.name.text = look?.celebrityID
            self.text.text = look?.description
            
    
    }
    
    func setValues(look:Look) {
        
        self.look = look
    }
}

