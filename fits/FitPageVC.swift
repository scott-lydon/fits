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
    var selectedPageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self

        setViewControllers([viewControllerAtIndex(0)], direction: .forward, animated: true, completion: nil)
        
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


extension FitPageVC : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! FitVC).index
        if index == 0 {
            return nil
        }
        
        index -= 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! FitVC).index
        
        index += 1
        
        if index == 5 {
            return nil
        }
        
        return viewControllerAtIndex(index)
        
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return selectedPageIndex
    }
    
}
