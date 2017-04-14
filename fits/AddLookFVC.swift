

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

        
        createProductSection()
        
        tableView?.frame = CGRect(x: 0, y: 65, width: view.frame.width, height: (view.frame.height - 65))
        
        view.bringSubview(toFront: submitBtn)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(true)
        
        form.remove(at: 1)
        createProductSection()
        print(lookData.description)
    }
 
    @IBAction func cancelPress() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindFromProductToLook(s: UIStoryboardSegue) {
        _ = s.source as? AddProductVCViewController
        // source properties can be accessed with . notation
    }
    
    func createProductSection() {
        let section = Section("PRODUCTS")
        
        for product in lookData.products {
            let k = ButtonRow(product.productName) { row in
                row.title = row.tag
                
            }.onCellSelection({ (_, _) in
                let vc = UIStoryboard(name: "AddLook", bundle: nil).instantiateViewController(withIdentifier: "AddProduct") as? AddProductVCViewController
                vc?.modalPresentationStyle = UIModalPresentationStyle.popover
                vc?.lookData = self.lookData
                vc?.productData = product
                self.present(vc!, animated: true, completion: nil)
            })
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
                //cell.contentView.ad/Users/ga-6/Desktop/fits/fits/AddLookFVC.swiftdSubview(titleLabel)
                
                
            }.onCellSelection {_,_ in
                self.lookData.lookID = UUID().uuidString
                self.lookData.userID = User.shared.username
                
                let celebrity: TextRow? = self.form.rowBy(tag: "celebrity")
                self.lookData.celebrityID = (celebrity?.value)!
                
                let description: TextRow? = self.form.rowBy(tag: "description")
                self.lookData.description = (description?.value)!
                
                let image: ImageRow? = self.form.rowBy(tag: "image")
                self.lookData.image = (image?.value)!
                
                self.lookData.imageURL = "gs://ill-gourmet.appspot.com/look_photos" + FIRAuth.auth()!.currentUser!.uid + "/\(Double(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
                
                
                
                let vc = UIStoryboard(name: "AddLook", bundle: nil).instantiateViewController(withIdentifier: "AddProduct") as? AddProductVCViewController
                vc?.modalPresentationStyle = UIModalPresentationStyle.popover
                vc?.lookData = self.lookData
                vc?.productData = self.productData
                self.present(vc!, animated: true, completion: nil)
                
        }
        
        form +++ section
    }

    @IBAction func submitPress(_ sender: Any) {
        
        let celebrity: TextRow? = form.rowBy(tag: "celebrity")
        let celebrityName = celebrity?.value
        
        let description: TextRow? = form.rowBy(tag: "description")
        let lookDescription = description?.value
        
        let image: ImageRow? = form.rowBy(tag: "image")
        let lookImage = image?.value
        
        let imagePath = "gs://ill-gourmet.appspot.com/look_photos" + FIRAuth.auth()!.currentUser!.uid + "/\(Double(Date.timeIntervalSinceReferenceDate * 1000)).jpg"
        
        let data = UIImageJPEGRepresentation(lookImage!, 0.8)
        
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let userID = FIRAuth.auth()?.currentUser
        
        let look = ["\(lookData.lookID)": ["celebrityID": celebrityName!,
                                    "imageURL": imagePath,
                                    "productIDs": lookData.productIDs,
                                    "description": lookDescription!,
                                    "postedByUserID": userID!,
                                    "approved": true]]
        
        Firebase.shared.ref.child("look").updateChildValues(look)
        
        var productReady = [String: [String: Any]]()
        for i in lookData.products {
            productReady = ["\(i.productID)": [  "brandName": i.brandName,
                                                                    "productName": i.productName,
                                                                    "price": i.price,
                                                                    "imageURL": i.imageURL,
                                                                    "tag": i.tags,
                                                                    "lookID": i.lookID,
                                                                    "productID": i.productID
                
                ]]
            
            Firebase.shared.ref.child("product").updateChildValues(productReady)
            
            Firebase.shared.storageRef.child(i.imageURL).put(data!, metadata: metadata) { (metadata, error) in
                if let error = error {
                    print ("error uploading: \(error)")
                    return
                }
            }
        }
        
        
        Firebase.shared.storageRef.child(imagePath).put(data!, metadata: metadata) { (metadata, error) in
            if let error = error {
                print ("error uploading: \(error)")
                return
            }
        }
    }
}

