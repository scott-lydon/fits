//
//  EmptyStateViewController.swift
//  fits
//
//  Created by Westley Lashley on 4/11/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import UIKit

class EmptyStateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var emptyStateTableView: UITableView!
    @IBOutlet weak var emptyStateImage: UIImageView!
    
    var stuff = ["something", "something else"]
    override func viewDidLoad() {
        super.viewDidLoad()
        if stuff.count > 0 {
            emptyStateTableView.isHidden = false
            emptyStateImage.isHidden = true
            //emptyStateTableView.reloadData()
        } else {
            emptyStateTableView.isHidden = true
            emptyStateImage.isHidden = false
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emptyStateTableView.dequeueReusableCell(withIdentifier: "emptyStateCell", for: indexPath) as! emtpyStateTableViewCell
        cell.itemLabel.text = stuff[indexPath.row]
        return cell
    }
}
