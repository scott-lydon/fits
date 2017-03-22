//
//  FitPageVC.swift
//  fits
//
//  Created by Vibes on 3/20/17.
//  Copyright © 2017 PZRT. All rights reserved.
//

import UIKit

class FitPageVC: UIPageViewController {
    
    var items : [String]?
    var selectedPageIndex  = 0
//    weak var fitPageVCDelegate : FitPageVCDelegate?
    
    var pageControl : UIPageControl = UIPageControl(frame: CGRect(x: UIScreen.main.bounds.width - 70, y: 466, width: 30, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
//        selectedPageIndex = 0
        
        setViewControllers([viewControllerAtIndex(0)], direction: .forward, animated: true, completion: nil)
        
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = 5
        self.pageControl.pageIndicatorTintColor = UIColor(red:0.60, green:0.60, blue:0.60, alpha:0.3)
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    init(images:[String]) {
        
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.items = images
    }
    
    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewControllerAtIndex (_ index:Int) -> FitVC {
        let fitVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FitVC") as! FitVC
        fitVC.setValues(UIImage(named:items![index])!, index: index)
        selectedPageIndex = index
        return fitVC
    }
    

}

//
//extension FitPageVC: UIPageViewControllerDelegate {
//    
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        if let index = selectedPageIndex {
//            fitPageVCDelegate?.pageVCIndex(pageVC: self, didUpdateIndex: index)
//        }
//    }
//}
//
//
//protocol FitPageVCDelegate:class {
//    
//    func pageVCCount(pageVC: FitPageVC, didUpdateCount count:Int)
//    func pageVCIndex(pageVC: FitPageVC, didUpdateIndex index: Int)
//}


extension FitPageVC : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! FitVC).index
        self.pageControl.currentPage = index

        if index == 0 {
            return nil
        }
        index -= 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! FitVC).index
        self.pageControl.currentPage = index

        index += 1

        if index == 5 {
            return nil
        }
        
        return viewControllerAtIndex(index)
                
    }

}
