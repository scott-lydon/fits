

import UIKit
import EZSwipeController

let illOrange = UIColor(red:1.00, green:0.31, blue:0.00, alpha:1.0)
let illGray = UIColor(red:0.59, green:0.59, blue:0.59, alpha:1.0)

class EZSwipeControllerVC: EZSwipeController {

    override func setupView() {
        datasource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension EZSwipeControllerVC: EZSwipeControllerDataSource {
    
    
    func indexOfStartingPage() -> Int {
        return 1 // EZSwipeController starts from 2nd, green page
    }
    
    func viewControllerData() -> [UIViewController] {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let UserProfileVC = storyboard.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let CartVC = storyboard.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        
        return [UserProfileVC, viewController, CartVC]
    }
    
    func navigationBarDataForPageIndex(_ index: Int) -> UINavigationBar {
        let title = ""
        let navigationBar = UINavigationBar()
        navigationBar.barStyle = UIBarStyle.default
        
        let navigationItem = UINavigationItem(title: title)
        navigationItem.hidesBackButton = true
        
        
//Setting the middle b
        //setting a view to a constant
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        
        //setting a UIImageView with the image and assigning it to another constant
       let imageView = UIImageView(image: #imageLiteral(resourceName: "illgourmet"))
        
        //setting the imageView to the superview
        imageView.frame = CGRect(x: 0, y: 12, width: view.frame.width, height: view.frame.height)
        
        //setting the image to the subview of the titleView
        view.addSubview(imageView)
        
        //setting the view equal to the navigation item's title view.
        navigationItem.titleView = view
        
        //<-Left page
        if index == 0 {
            
            //Left
            let leftButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: nil)
            leftButtonItem.tintColor = illOrange
            navigationItem.leftBarButtonItem = leftButtonItem
            
            //Middle
            navigationItem.titleView = nil
            navigationItem.title = "Your Account"
            
            //Right
            
            
            
            let leftPageRightIconView = UIView(frame: CGRect(x: 0, y: 0, width: 22, height: 18))
            let leftPageRightIconImage = UIImageView(image: #imageLiteral(resourceName: "ill_tiny_nav_icon"))
          leftPageRightIconImage.frame = CGRect(x: 0, y: 0, width: leftPageRightIconView.frame.width, height: leftPageRightIconView.frame.height)
            leftPageRightIconView.addSubview(leftPageRightIconImage)
            
            let rightIconImage = #imageLiteral(resourceName: "ill_tiny_nav_icon")
            UIBarButtonItem(
            let rightButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ill_tiny_nav_icon"), style: UIBarButtonItemStyle.plain, target: self, action: nil)
//            rightButtonItem.customView = leftPageRightIconView

            rightButtonItem.tintColor = illOrange
            navigationItem.rightBarButtonItem = rightButtonItem
            
            
            
            //CENTER Page
        } else if index == 1 {
            
            //Left
            let leftButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "profile_icon"), style: UIBarButtonItemStyle.plain, target: self, action: nil)
            leftButtonItem.tintColor = illGray
            navigationItem.leftBarButtonItem = leftButtonItem
            
            //Right
            let rightButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cart_icon"), style: UIBarButtonItemStyle.plain, target: self, action: nil)
            rightButtonItem.tintColor = illGray
            navigationItem.rightBarButtonItem = rightButtonItem
            
            
            //Right page ->
        } else if index == 2 {
            
            let leftButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ill_tiny_nav_icon"), style: UIBarButtonItemStyle.done, target: self, action: nil)
            leftButtonItem.tintColor = illOrange
            navigationItem.leftBarButtonItem = leftButtonItem
            
            navigationItem.titleView = nil
            navigationItem.title = "Your Cart"

        }
        navigationBar.pushItem(navigationItem, animated: false)
        return navigationBar
    }
}
