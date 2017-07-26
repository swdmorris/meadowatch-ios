//
//  FlowerPlot.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/25/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import MapKit

struct FlowerPlot {
    init(json: Any) {
        let jsonDictionary = json as! [String : Any]
        latitude = jsonDictionary["lat"] as! Double
        longitude = jsonDictionary["long"] as! Double
        elevation = jsonDictionary["elevation"] as! Double
        plotNumber = jsonDictionary["plotNumber"] as! Int
    }
    
    private(set) var plotNumber: Int
    private var latitude: Double
    private var longitude: Double
    private var elevation: Double // in meters
    
    var coordinate: CLLocation {
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}
