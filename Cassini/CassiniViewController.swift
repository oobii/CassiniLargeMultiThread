//
//  CassiniViewController.swift
//  CassiniLargeMultiThread
//
//  Created by martynov on 2017-08-01.
//  Copyright © 2017 martynov. All rights reserved.
//

import UIKit

// This CassiniViewController is "master"
// On the initial startup SplitView controller collapses and by default shows secondary ("detail") view controller
// There is a delegate method that can be used to show seconday or primary ("master") vc, see Step 2

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {
    
    // https://useyourloaf.com/blog/split-view-controller-display-modes/ Explanation but with viewDidLoad()
    // We want to put menu as the first screen instead of blank screen as we start our app
    // Step 1
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // using contents property added via extention of UIViewController
        if let imageVC = segue.destination.contents as? ImageViewController {
            imageVC.imageURL = DemoURL.NASA[segue.identifier ?? ""]
            imageVC.title = (sender as? UIButton)?.currentTitle
        }
    }
    
    // Step 2:
    // Implementing one of the methods of UISplitViewControllerDelegate
    // secondaryViewController is "secondary"(aka "detail")
    // primaryViewController is "master" (aka “primary”)
    // when we first start up, the blank detail is put on top of the master and we don't want that when the detail
    // is blank
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contents == self {
            if let ivc = secondaryViewController.contents as? ImageViewController, ivc.imageURL == nil {
                return true
            }
        }
        return false
    }
    
    
}





// To simplify detection that VC is embedded into NavigationController
extension UIViewController {
    var contents: UIViewController {
        return  (self as? UINavigationController)?.visibleViewController ?? self
        
    }
}
