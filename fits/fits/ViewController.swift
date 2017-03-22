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

    let client: Client = Client(spaceIdentifier: SPACE_ID, accessToken: ACCESS_TOKEN)


    @IBOutlet weak var table: UITableView!
    var pageViewControllers = [FitPageVC]()




    override func viewDidLoad() {
        super.viewDidLoad()
        
        client.fetchEntries(matching: ["limit": 100]) { [weak self] (result: Result<Contentful.Array<Entry>>) in
            switch result {
            case .success(let entries):
                print("=================Printing Entries=================")
                entries.items.forEach { entry in
                    print(entry.identifier)
                }
                print("==============Done Printing Entries===============")
            case .error(let error):
                self?.handle(error: error)
            }
        }
        
        table.rowHeight = 0.90 * view.frame.size.height
        
        for _ in 0...6 {
            
            let pageViewController = FitPageVC(images: ["1","2","3","4","5"] )
            pageViewControllers.append(pageViewController)
        }
        
    }
    
    func handle(error: Error) {
        print("Uh oh, something went wrong. You can do what you want with this \(error)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
        
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

