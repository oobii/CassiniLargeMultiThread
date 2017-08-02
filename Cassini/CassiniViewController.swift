//
//  CassiniViewController.swift
//  CassiniLargeMultiThread
//
//  Created by martynov on 2017-08-01.
//  Copyright © 2017 martynov. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {
    
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
}

// To simplify detection that VC is embedded into NavigationController
extension UIViewController {
    var contents: UIViewController {
        return  (self as? UINavigationController)?.visibleViewController ?? self
        
    }
}
