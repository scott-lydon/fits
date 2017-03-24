//
//  ViewController.swift
//  fits
//
//  Created by Vibes on 3/17/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import UIKit
import Contentful
import Interstellar

let SPACE_ID = "omalhxi5j9ol"
let ACCESS_TOKEN = "53feb22a0f6700e51ae6308aaa809fba1c700e13a9f65d9395132d8b812f5a1f"

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var pageViewControllers = [FitPageVC]()
    
    let client: Client = Client(spaceIdentifier: SPACE_ID, accessToken: ACCESS_TOKEN)
    
    private let main = OperationQueue.main
    
    private let async: OperationQueue = {
        
        let operationQueue = OperationQueue()
        
        operationQueue.maxConcurrentOperationCount = 8
        return operationQueue
    }()
    
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        reload()
        table.rowHeight = 0.88 * view.frame.size.height
        super.viewDidLoad()
        
    }
    
    func reload() {
        
        self.client.fetchEntries(matching: ["limit": 100]) { [weak self] (result: Result<Contentful.Array<Entry>>) in
            switch result {
            case .success(let entries):
                entries.items.forEach { entree in
                    
                    self!.pageViewControllers.append(FitPageVC(fit : Fit(entry: entree)))
                    
                }
                
                DispatchQueue.main.async {
                    self?.table.reloadData()
                }
                
            case .error(let error):
                self?.handle(error: error)
            }
        }
        
        DispatchQueue.main.async {
            self.table.reloadData()
        }
        
    }
    
    func handle(error: Error) {
        print("Uh oh, something went wrong while fetchig data from Contentful")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageViewControllers.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fitCell", for: indexPath)
        
        
        let pageViewController = pageViewControllers[indexPath.row]
        addChildViewController(pageViewController)
        pageViewController.view.frame = cell.contentView.bounds
        pageViewController.didMove(toParentViewController: self)
        cell.contentView.addSubview(pageViewController.view)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let pageViewController = pageViewControllers[indexPath.row]
        pageViewController.removeFromParentViewController()
        pageViewController.view.removeFromSuperview()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

