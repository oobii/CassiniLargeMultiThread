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
        let NASAURLStrings = ["Cassini" : "http//www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
                              "Earth" : "http//www.jpl.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
                              "Saturn" : "http//www.jpl.nasa.gov/default/files/saturn_collage.jpg"]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
    
}
