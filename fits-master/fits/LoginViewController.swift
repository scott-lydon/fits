//
//  LoginViewController.swift
//  fits
//
//  Created by Vibes on 3/28/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    private var _authHandle: FIRAuthStateDidChangeListenerHandle!
    
    var user: FIRUser?
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    
    func configureAuth() {
        _authHandle = FIRAuth.auth()?.addStateDidChangeListener({ (auth:FIRAuth, user:FIRUser?) in
            if user != nil {
                print(" user \(user?.email)")
            }
        })
        
    }
    
    func deconfigureAuth() {
        
        FIRAuth.auth()?.removeStateDidChangeListener(_authHandle!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureAuth()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        deconfigureAuth()
    }
    
    @IBAction func login(_ sender: Any) {
        
        FIRAuth.auth()?.signIn(withEmail: username.text!, password: password.text!) {
            (user, error) in
            
            if user != nil && error == nil {
                
                print("user logged in \(user?.email!)")
                
            } else {
                
                print("error : \(error)")
            }
            
        }

    }
    
    @IBAction func signup(_ sender: Any) {
        
        let alert = UIAlertController(title: "HEY", message: "YP", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { action in
            
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!) { (user, error) in
                
                FIRAuth.auth()?.signIn(withEmail: self.username.text!, password: self.password.text! )
            }
            
        }
        
    let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        
        alert.addTextField { textEmail in textEmail.placeholder = " Email" }
        alert.addTextField { textPassword in
            textPassword.placeholder = "pw"
            textPassword.isSecureTextEntry = true
        }
    
        
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert,animated: true,completion: nil)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//extension LoginViewController : UITextFieldDelegate {
//    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        
//        if textField = username {
//            username.becomeFirstResponder()
//        }
//        
//        if textField = password {
//            password.becomeFirstResponder()
//        }
//        
//        return true
//    }
//    
//}
