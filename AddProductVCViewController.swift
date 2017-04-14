
import Eureka
import UIKit

class AddProductVCViewController: FormViewController {

    @IBOutlet weak var saveBtn: UIButton!
    
    var collectionView: UICollectionView!
    
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
            
            +++ Section() { section in
                var header = HeaderFooterView<TVC>(.nibFile(name: "TVC", bundle: nil)) //<MyHeaderNibFile>(.nibFile(name: "TVC", bundle: nil))
                
                // Will be called every time the header appears on screen
                header.onSetupView = { view, _ in
                    for i in view.subviews[0].subviews {
                        if let collectionView = i as? UICollectionView {
                            self.collectionView = collectionView
                        }
                    }
                    // Commonly used to setup texts inside the view
                    // Don't change the view hierarchy or size here!
                }
                section.header = header
            }
            
            
            <<< ImageRow() {
                $0.title = "Image"
            }
            <<< TextRow(){
                $0.title = "Product Name"
            }
            <<< DecimalRow() {
                $0.useFormatterDuringInput = true
                $0.title = "Price"
                $0.value = 0
                let formatter = CurrencyFormatter()
                formatter.locale = .current
                formatter.numberStyle = .currency
                $0.formatter = formatter
            }
            <<< TextRow(){
                $0.title = "Tags"
                $0.placeholder = "Seperated by Commas"
            }
        view.bringSubview(toFront: saveBtn)
        
    }
    
    
    @IBAction func cancelPress() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePress(_ sender: Any) {
        performSegue(withIdentifier: "unwindFromProductToLook", sender: nil)
    }
    
}

class CurrencyFormatter : NumberFormatter, FormatterProtocol {
    override func getObjectValue(_ obj: AutoreleasingUnsafeMutablePointer<AnyObject?>?, for string: String, range rangep: UnsafeMutablePointer<NSRange>?) throws {
        guard obj != nil else { return }
        let str = string.components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
        obj?.pointee = NSNumber(value: (Double(str) ?? 0.0)/Double(pow(10.0, Double(minimumFractionDigits))))
    }
    
    func getNewPosition(forPosition position: UITextPosition, inTextInput textInput: UITextInput, oldValue: String?, newValue: String?) -> UITextPosition {
        return textInput.position(from: position, offset:((newValue?.characters.count ?? 0) - (oldValue?.characters.count ?? 0))) ?? position
    }
}
