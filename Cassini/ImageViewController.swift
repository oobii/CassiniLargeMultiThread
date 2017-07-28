//
//  ImageViewController.swift
//  Cassini
//
//  Created by martynov on 2017-07-27.
//  Copyright © 2017 martynov. All rights reserved.
//

// This is a reusable MVC

import UIKit

class ImageViewController: UIViewController {

    
    var imageURL: URL? {
        didSet {
            // first we clear the previous image
            image = nil
            fetchURL()
        }
    }
  
    
    private func fetchURL() {
        
        // we use let-url because imgeURL is Optional
        if let url = imageURL {
            let urlContent = try? Data(contentsOf: url)
            // we are using let-imageData because urlContent is Data?
            if let  imageData = urlContent {
                image = UIImage(data: imageData)
                // we will automatically do image-setter below
            }
        }
    
    }
    
    
    // this is a good place to add subviews , we already loaded our view
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)

        imageURL = DemoURL.stanford
        
   // after that assigment property observer for imageURL will be called
        
    }
    
    
    private var imageView = UIImageView()
    
    
    // image views dont have to have image , they can be empty
    // that's why we use Optional
    // my image can be nil
    private var image: UIImage? {
        
        get {
            return imageView.image
            
        }
        
        set {
            imageView.image = newValue
            imageView.sizeToFit()
        
    }
    
    
  }
    
}
