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
    
    @IBOutlet private weak var mapView: MKMapView! {
        didSet {
            mapView.addAnnotations(annotations)
        }
    }
    
    fileprivate lazy var annotations: [MKAnnotation] = {
        return self.dataSource.plots.map { plot -> MKAnnotation in
            let pin = MKPointAnnotation()
            pin.coordinate = plot.coordinate.coordinate
            pin.title = "Plot \(plot.plotNumber)"
            return pin
        }
    }()
    
    private var hasAppeared = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !hasAppeared {
            mapView.showAnnotations(annotations, animated: true)
            hasAppeared = true
        }
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
            showDetails(for: plot)
        }
    }
}
