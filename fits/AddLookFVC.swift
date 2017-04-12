

import UIKit
import Eureka
import AVFoundation

class AddLookFVC: FormViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 65))
        self.view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Add a Look")
        let cancelbtn = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.done, target: nil, action: #selector(cancelPress))
        navItem.leftBarButtonItem = cancelbtn
        navItem.leftBarButtonItem?.tintColor = illOrange
    
        navBar.setItems([navItem], animated: false)
        
        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        }
        
        form +++ Section("")
            <<< TextRow(){ row in
                row.title = "Celebrity Name"
                row.placeholder = "Kanye West"
            }
            <<< TextRow(){
                $0.title = "Description"
                $0.placeholder = "Where was this taken?"
            }
            <<< ImageRow() {
                $0.title = "Image"
            }
            
            +++ Section("PRODUCT")
            
//            <<< PushRow() {
//                  $0.title = "Add a Product"
//            }
        
        tableView?.frame = CGRect(x: 0, y: 65, width: view.frame.width, height: (view.frame.height - 65))

    }
 
    @IBAction func cancelPress() {
        dismiss(animated: true, completion: nil)
    }

}

