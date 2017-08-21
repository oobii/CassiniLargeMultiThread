//
//  ImageViewController.swift
//  Cassini
//
//  Created by martynov on 2017-07-27.
//  Copyright © 2017 martynov. All rights reserved.
//

// This is a reusable MVC

// All and only UI activity is happening on the single Main queue
// All other on Global concurrent queues (multiple)

import UIKit

    // MARK: Model

class ImageViewController: UIViewController  {
    
    // if we set or re-set URL we might want to fetch() image if we are on screen
    var imageURL: URL? {
        didSet {
            // first we clear the previous image
            image = nil
            
            // Step21: if we donr have windows we are not on screen but if we have view.window then we are on screen
            // and fetch right away
            // compare two palaced Step20 and 21 for fetch()
            // it's done to minimize unnessesary fetching from the Internet and waste user's cellular data plan
            // if we use tab bars
            
            if view.window != nil {
                fetchURL()
            }
        }
    }
    
    // MARK: Private Implementation
    
    // Put this ActivityIndicatorView via Storyboard, ajusted to be at the
    // same level in the hierarhy as ImageView but below it to be visible
    // on the stck of views
    // In Atribute Inspector>Behaviour Animation we set is off
    // so it wont animate beore we create a Tread (DispatchQueue.global.asyn)
    // Also added New constrains to have it in between
    //
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private func fetchURL() {
        // we use let-url because imgeURL is Optional
        if let url = imageURL {
            
            // Aug21/17 -1
            spinner.startAnimating()
            
            // [weak self] is to break cycle, elf (ImageView Controller is captured inside the closure so
            // it need to be weak
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContent = try? Data(contentsOf: url)
                // we are using let-imageData because urlContent is Data?
                // url == self?.imageURL to check that we are not coming with new self?.imageURL while url is captured by closure
                if let  imageData = urlContent, url == self?.imageURL {
                    
                    // UI has to be on the main queue
                    DispatchQueue.main.async {
                        self?.image = UIImage(data: imageData)
                        // we will automatically do image-setter below
                    }
                }
                
            }
        }
    }
    
    
    // MARK: View Controller Lifecycle
    
    // this is a good place to add subviews , we already loaded our view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Step23: commenting/deleting this one below , because we added imageView as a subview to scrollView
        // view.addSubview(imageView)
        
        // old code // imageURL = DemoURL.stanford
        // after that assigment property observer for imageURL will be called
    }
    
    // Step20: we add this func for the case when our imageView is not currently on screen but  will appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchURL()
        }
    }
    
    // MARK: User Interface 
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            
            // Step 26:
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 2
            
            //Step 27: for zooming we need to use Delegate
            scrollView.delegate = self
            
            //Step 24: we have to set it otherwise we have it at default (0,0)
            scrollView.contentSize = imageView.frame.size
            
            // Step 22: when the scroll get set we add imageView to scrollView as a subview
            scrollView.addSubview(imageView)
        }
    }
    
  // Step 28: need to make it fileprivate for viewForZooming to see it
    fileprivate var imageView = UIImageView()
    
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
            
            // Step25: we should re-set contentSize again when we set our imageView
            // and there might be a case when scrollView is nil and we need to do Optional chaining
            // To remember: any time we are accessing outlets that can be called during prepare, we have to use Optinal chaning
            scrollView?.contentSize = imageView.frame.size
            
            //Aug 21/17 -2  we stop any time we set the new image
            // we use Optional chaining so when we have  spiiner == nil during prepare  the app would crash
            spinner?.stopAnimating()
        }
    }
    
}

extension ImageViewController: UIScrollViewDelegate {
    
    // Step 27: using without class extention , see next example with class extention
    // press "alt-pinch" on track pad for zooming in and out
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}


