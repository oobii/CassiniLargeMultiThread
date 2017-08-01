//
//  DemoURL.swift
//  Cassini
//
//  Created by martynov on 2017-07-26.
//  Copyright © 2017 martynov. All rights reserved.
//

import Foundation

struct DemoURL {
    
    static let stanford = URL(string: "http://m.c.lnkd.licdn.com/media/p/8/005/06f/25d/1d60a51.jpg")
    
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = ["Cassini" : "http://photojournal.jpl.nasa.gov/jpeg/PIA03883.jpg",
                              "Earth" : "http://www.nasa.gov/sites/default/files/styles/946xvariable_height/public/wave_earth_mosaic_3.jpg",
                              "Saturn" : "https://www.nasa.gov/sites/default/files/saturn_collage.jpg"]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
    
}
