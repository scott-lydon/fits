

import UIKit
import Contentful
import Interstellar
import EZSwipeController

//let SPACE_ID_UserProfileVC = "omalhxi5j9ol"
//let ACCESS_TOKEN_UserProfileVC = "53feb22a0f6700e51ae6308aaa809fba1c700e13a9f65d9395132d8b812f5a1f"

class UserProfileVC: UIViewController {

    @IBOutlet weak var myFavoritesView: UIView!
    @IBOutlet weak var myLooksView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emptyStateMyFavoritesImage: UIImageView!
    @IBOutlet weak var emptyStateMyFavoritesLabel: UILabel!
    @IBOutlet weak var emptyStateMyLooksImage: UIImageView!
    @IBOutlet weak var emptyStateMyLooksLabel: UILabel!
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            myFavoritesView.isHidden = false
            myLooksView.isHidden = true
//            emptyStateMyFavoritesImage.isHidden = false
//            emptyStateMyFavoritesLabel.isHidden = false
//            emptyStateMyLooksImage.isHidden = true
//            emptyStateMyLooksLabel.isHidden = true
        case 1:
            myFavoritesView.isHidden = true
            myLooksView.isHidden = false
//            emptyStateMyLooksImage.isHidden = false
//            emptyStateMyLooksLabel.isHidden = false
//            emptyStateMyFavoritesImage.isHidden = true
//            emptyStateMyFavoritesLabel.isHidden = true
        default: break
        }
    }
    
    
    

//    var stuff = ["something", "something else"]
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        if stuff.count > 0 {
//            emptyStateTableView.isHidden = false
//            emptyStateImage.isHidden = true
//            //emptyStateTableView.reloadData()
//        } else {
//            emptyStateTableView.isHidden = true
//            emptyStateImage.isHidden = false
//        }
//    }

        override func viewDidLoad() {

    
        }

}
//    var pageViewControllers = [FitPageVC]()
//    
//    private let refreshControl = UIRefreshControl()
//    
//    let client: Client = Client(spaceIdentifier: SPACE_ID, accessToken: ACCESS_TOKEN)
//    
//    private let main = OperationQueue.main
//    
//    private let async: OperationQueue = {
//        
//        let operationQueue = OperationQueue()
//        
//        operationQueue.maxConcurrentOperationCount = 8
//        return operationQueue
//    }()
//    
//    @IBOutlet weak var table: UITableView!
//    
//    
//    override func viewDidLoad() {
//        reload()
//        table.rowHeight = 0.88 * view.frame.size.height
//        super.viewDidLoad()
//        
//    }
//
//    func reload() {
//        
//        self.client.fetchEntries(matching: ["limit": 100]) { [weak self] (result: Result<Contentful.Array<Entry>>) in
//            switch result {
//            case .success(let entries):
//                entries.items.forEach { entree in
//                    
//                    self!.pageViewControllers.append(FitPageVC(fit : Fit(entry: entree)))
//                    
//                }
//                
//                DispatchQueue.main.async {
//                    self?.table.reloadData()
//                }
//                
//            case .error(let error):
//                self?.handle(error: error)
//            }
//        }
//        
//        DispatchQueue.main.async {
//            self.table.reloadData()
//        }
//        
//    }
//    
//    func handle(error: Error) {
//        print("Uh oh, something went wrong while fetching data from Contentful")
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pageViewControllers.count
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "fitCell", for: indexPath)
//        cell.backgroundColor = UIColor.green
//        if #available(iOS 10.0, *) {
//            tableView.refreshControl = refreshControl
//        } else {
//            tableView.addSubview(refreshControl)
//        }
//        
//        
//        
//        let pageViewController = pageViewControllers[indexPath.row]
//        addChildViewController(pageViewController)
//        pageViewController.view.frame = cell.contentView.bounds
//        pageViewController.didMove(toParentViewController: self)
//        cell.contentView.addSubview(pageViewController.view)
//        
//        return cell
//        
//    }
//    
//    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        let pageViewController = pageViewControllers[indexPath.row]
//        pageViewController.removeFromParentViewController()
//        pageViewController.view.removeFromSuperview()
//        
//    }
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//}

// class UserProfileVC: UIViewController, UISearchBarDelegate {

    
    //@IBOutlet weak var myFavoritesEmptyStateImage: UIImageView!
    //@IBOutlet weak var myFavoritesEmptyStateLabel: UILabel!
    
    
//    var favorites: [String] = []
//    var looks: [String] = []
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        scopeBar.delegate = self
//        scopeBar.scopeButtonTitles = ["My Favorites", "My Looks"]
//        scopeBar.sizeToFit()
    
        //myFavoritesEmptyStateImage.isHidden = true
        //myFavoritesEmptyStateLabel.isHidden = true
        
//    }
//    
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
    
        // Load empty state view if necessary.
//        if ViewController.numberOfRows(inSection: 0) == 0 {
//            let emptyStateLabel = UILabel(frame: tableView.frame)
//            
//            
//            myFavoritesEmptyStateImage.isHidden = false
//            myFavoritesEmptyStateLabel.isHidden = false
////            myFavoritesEmptyStateLabel.text = "Your favorites will show up here."
//            
//            // style it as necessary
//            tableView.backgroundView = emptyStateLabel
//        } else {
//            tableView.backgroundView = nil
//            myFavoritesEmptyStateImage.isHidden = true
//            myFavoritesEmptyStateLabel.isHidden = true
//        }
//    }
//    
//
//   
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        
//    }
//    
//}
