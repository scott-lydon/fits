//
//  WebVC.swift
//  fits
//
//  Created by Vibes on 3/24/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import UIKit

class WebVC: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func closeButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    var urlReceptacle : URL?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
            let request = URLRequest(url: urlReceptacle!)
            webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
