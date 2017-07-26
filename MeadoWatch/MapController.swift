//
//  MapController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/25/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import MapKit

protocol MapDataSource: class {
    var plots: [FlowerPlot] { get }
}

class MapController: UIViewController {
    weak var dataSource: MapDataSource!
    
    @IBOutlet private weak var mapView: MKMapView!
    
    fileprivate var annotations: [MKAnnotation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        annotations = dataSource.plots.map { plot -> MKAnnotation in
            let pin = MKPointAnnotation()
            pin.coordinate = plot.coordinate.coordinate
            return pin
        }
        mapView.addAnnotations(annotations)
    }
}

extension MapController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let index = annotations.index { annotation -> Bool in
            return annotation.coordinate.latitude == view.annotation!.coordinate.latitude
                && annotation.coordinate.longitude == view.annotation!.coordinate.longitude
        }
        if let index = index {
            let plot = dataSource.plots[index]
            print("plot number: \(plot.plotNumber)")
        }
    }
}
