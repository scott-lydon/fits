

import UIKit
import PassKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let paymentHandler = PaymentHandler()

    @IBOutlet weak var applePayView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let result = PaymentHandler.applePayStatus()
        
        var button: UIButton?
        
        if result.canMakePayments {
            button = PKPaymentButton(type: .buy, style: .black)
            button?.addTarget(self, action: #selector(CartVC.payPressed), for: .touchUpInside)
        } else if result.canSetupCards {
            button = PKPaymentButton(type: .setUp, style: .black)
            button?.addTarget(self, action: #selector(CartVC.setupPressed), for: .touchUpInside)
        }
        
        if button != nil {
            button!.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
            applePayView.addSubview(button!)
        }

        
        tableView.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: "CartCell")

    }
    
    func payPressed(sender: AnyObject) {
        paymentHandler.startPayment() { (success) in
            if success {
                self.performSegue(withIdentifier: "Confirmation", sender: self)
            } else {
                
            }
        }
    }
    
    func setupPressed(sender: AnyObject) {
        let passLibrary = PKPassLibrary()
        passLibrary.openPaymentSetup()
    }

    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let remove = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
//            self.toDoList.toDos.remove(at: indexPath.row)
            self.tableView.reloadData()
        }

        
        return [remove]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        
            
            return cell
        
        
    }
}

