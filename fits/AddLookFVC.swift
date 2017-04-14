

import UIKit
import Eureka
import AVFoundation
import Firebase


class AddLookFVC: FormViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var submitBtn: UIButton!
    
    var productData = ProductData()
    var lookData = LookData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 65))
        self.view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Add a Look")
        let cancelbtn = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.done, target: nil, action: #selector(cancelPress))
        navItem.leftBarButtonItem = cancelbtn
        navItem.leftBarButtonItem?.tintColor = illOrange
        navBar.setItems([navItem], animated: false)
        let photos = ["cats", "dgst"]
        
        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        }
        
        
        form +++ Section("")
            <<< TextRow(){ row in
                row.title = "Celebrity Name"
                row.placeholder = "Kanye West"
                row.tag = "celebrity"
            }
            <<< TextRow(){ row in
                row.title = "Description"
                row.placeholder = "Where was this taken?"
                row.tag = "description"
            }
            <<< ImageRow() { row in
                row.title = "Image"
                row.tag = "image"
        }

        
        let section = Section("PRODUCTS")
        
        for _ in photos {
            let k = LabelRow() {
                $0.title = ""
            }
            section.append(k)
        }
        
        section <<< TextRow() {
            $0.title = ""
            }.cellSetup { cell, row in
                
                let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
                imageView.image = #imageLiteral(resourceName: "fillerPhoto")
                cell.contentView.addSubview(imageView)
                let titleLabel = UILabel(frame: CGRect(x: 30, y: 10, width: cell.bounds.width, height: cell.bounds.height))
                titleLabel.text = "Add a Product"
                cell.contentView.addSubview(titleLabel)
                
                
            }.onCellSelection {_,_ in
                let vc = UIStoryboard(name: "AddLook", bundle: nil).instantiateViewController(withIdentifier: "AddProduct")
                vc.modalPresentationStyle = UIModalPresentationStyle.popover
                self.present(vc, animated: true, completion: nil)
        }
        
        form +++ section
        
        
        tableView?.frame = CGRect(x: 0, y: 65, width: view.frame.width, height: (view.frame.height - 65))
        
        view.bringSubview(toFront: submitBtn)
        
    }    
 
    @IBAction func cancelPress() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindFromProductToLook(s: UIStoryboardSegue) {
        let source = s.source as? AddProductVCViewController
        // source properties can be accessed with . notation
    }

    @IBAction func submitPress(_ sender: Any) {
        let lookUuid = UUID().uuidString
        
        let celebrity: TextRow? = form.rowBy(tag: "celebrity")
        let celebrityName = celebrity?.value
        
        let description: TextRow? = form.rowBy(tag: "description")
        let lookDescription = description?.value
        
        let image: ImageRow? = form.rowBy(tag: "image")
        let lookImage = image?.value
        
        let imagePath = "look_photos/" + FIRAuth.auth()!.currentUser!.uid + "/\(Double(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
        
        let data = UIImageJPEGRepresentation(lookImage!, 0.8)
        
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let look = ["\(lookUuid)": ["celebrityID": "\(celebrityName)",
                                    "imageURL": "https://images.complex.com/complex/image/upload/\(imagePath)",
                                    "productIDs": [""],
                                    "description": "\(lookDescription)",
                                    "postedByUserID": "\(FIRAuth.auth()?.currentUser)",
                                    "approved": true]]
        
        print(Firebase.shared.ref.child("look").child("lookID13"))
        
        Firebase.shared.ref.child("look").updateChildValues(look)
        
        
        print(imagePath)
        Firebase.shared.storageRef.child(imagePath).put(data!, metadata: metadata) { (metadata, error) in
            if let error = error {
                print ("error uploading: \(error)")
                return
            }
        }
    }
}

