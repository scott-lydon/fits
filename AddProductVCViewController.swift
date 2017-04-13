
import Eureka
import UIKit

class AddProductVCViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 65))
        self.view.addSubview(navBar)
        let navItem = UINavigationItem(title: "Add a Product")
        let cancelbtn = UIBarButtonItem(title: "<", style: UIBarButtonItemStyle.done, target: nil, action: #selector(cancelPress))
        navItem.leftBarButtonItem = cancelbtn
        navItem.leftBarButtonItem?.tintColor = illOrange
        navBar.setItems([navItem], animated: false)
        
        
        
        ImageRow.defaultCellUpdate = { cell, row in
            cell.accessoryView?.layer.cornerRadius = 17
            cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        }
        
        
        form +++ Section("")
            <<< TextRow(){ row in
                row.title = "Brand Name"
            }
            <<< TextRow(){
                $0.title = "Product Name"
            }
            <<< ImageRow() {
                $0.title = "Image"
            }
            
            
            <<< TextRow(){
                $0.title = "Product Name"
            }

    }
    
    @IBAction func cancelPress() {
        dismiss(animated: true, completion: nil)
    }
}
