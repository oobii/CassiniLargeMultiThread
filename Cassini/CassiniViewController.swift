//
//  CassiniViewController.swift
//  CassiniLargeMultiThread
//
//  Created by martynov on 2017-08-01.
//  Copyright © 2017 martynov. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destVC = segue.destination as? ImageViewController {
            if let identifier = segue.identifier {
                destVC.imageURL = DemoURL.NASA[identifier]
            }
            
            
        }
    }
    
}

