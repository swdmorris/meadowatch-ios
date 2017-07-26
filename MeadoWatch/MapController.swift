//
//  MapController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/25/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import MapKit

protocol MapDataSource: class {
    var gpsPoints: [CLLocation] { get }
}

class MapController: UIViewController {
    weak var dataSource: MapDataSource!
    
    @IBOutlet private weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(dataSource.gpsPoints)
    }
}
