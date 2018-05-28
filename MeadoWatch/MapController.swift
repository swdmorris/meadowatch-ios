//
//  MapController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/25/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import MapKit

protocol MapDataSource: PlotListDataSource {
    var allowShowPlotDetails: Bool { get }
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
    
    fileprivate func plot(for annotationView: MKAnnotationView) -> FlowerPlot? {
        return dataSource.plots.first { plot -> Bool in
            annotationView.annotation?.coordinate.latitude == plot.latitude && annotationView.annotation?.coordinate.longitude == plot.longitude
        }
    }
}

extension MapController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        // TODO: show callout and handle showing details from callout
        guard dataSource.allowShowPlotDetails else {
            return
        }
        if let plot = plot(for: view),
            let viewModel = dataSource.viewModelForPlot(plot) {
            showDetails(for: viewModel)
        }
    }
}
