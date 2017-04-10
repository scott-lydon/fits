

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
    
//MARK set center page as the start
    func indexOfStartingPage() -> Int {
        return 1
    }

//MARK: setup for 3 page swipe
    func viewControllerData() -> [UIViewController] {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let UserProfileVC = storyboard.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let CartVC = storyboard.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        
        return [UserProfileVC, viewController, CartVC]
    }
    
//MARK: Create Nav bar
    func navigationBarDataForPageIndex(_ index: Int) -> UINavigationBar {
        let title = ""
        let navigationBar = UINavigationBar()
        navigationBar.barStyle = UIBarStyle.default
        
        let navigationItem = UINavigationItem(title: title)
        navigationItem.hidesBackButton = true
        
        
//MARK: Setting title
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        let imageView = UIImageView(image: #imageLiteral(resourceName: "illgourmet"))
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(imageView)
        navigationItem.titleView = view
        
//MARK: Page Left
        if index == 0 {
            
            let leftButtonItem = UIBarButtonItem(title: "Logout", style: UIBarButtonItemStyle.plain, target: self, action: nil)
            leftButtonItem.tintColor = illOrange
            navigationItem.leftBarButtonItem = leftButtonItem
            
            navigationItem.titleView = nil
            navigationItem.title = "Your Account"
            
            navigationItem.rightBarButtonItem = makeButtonImg(image: #imageLiteral(resourceName: "ill_tiny_nav_icon"), w: 22, h: 22, tintColor: illOrange)
            
//MARK: Page Center
        } else if index == 1 {
            
            navigationItem.leftBarButtonItem = makeButtonImg(image: #imageLiteral(resourceName: "profile_icon"), w: 22, h: 22, tintColor: illGray)
            
            navigationItem.rightBarButtonItem = makeButtonImg(image: #imageLiteral(resourceName: "cart_icon"), w: 22, h: 22, tintColor: illGray)
         
//MARK: Page Right
        } else if index == 2 { /*Page Right*/
            
            navigationItem.leftBarButtonItem = makeButtonImg(image: #imageLiteral(resourceName: "ill_tiny_nav_icon"), w: 22, h: 22, tintColor: illOrange)
            
            navigationItem.titleView = nil
            navigationItem.title = "Your Cart"

        }
        navigationBar.pushItem(navigationItem, animated: false)
        return navigationBar
    }
    
//MARK: Make nav bar button
    private func makeButtonImg(image: UIImage, w: CGFloat, h: CGFloat, tintColor: UIColor) -> UIBarButtonItem {
        let newSize = CGSize(width: w, height: h)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        let buttonItem = UIBarButtonItem(image: newImage, style: UIBarButtonItemStyle.plain, target: self, action: nil)
        buttonItem.tintColor = tintColor
        return buttonItem
    }
    
}


