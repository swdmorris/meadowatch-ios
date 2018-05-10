//
//  HikeViewModel.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/9/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import MapKit

class HikeViewModel {
    init(overviewPdfFilename: String,
         gpsPointsFilename: String) {
        self.overviewPdfFilename = overviewPdfFilename
        self.gpsPointsFilename = gpsPointsFilename
    }
    
    fileprivate var overviewPdfFilename: String
    
    private var gpsPointsFilename: String
    fileprivate lazy var flowerPlots: [FlowerPlot] = {
        let gpsPlist = Bundle.main.path(forResource: self.gpsPointsFilename, ofType: "plist", inDirectory: "")!
        var locations = [CLLocation]()
        let thing = NSArray(contentsOfFile: gpsPlist)!
        let array: [FlowerPlot] = thing.map { plotDictionary -> FlowerPlot in
            return FlowerPlot(json: plotDictionary)
        }
        return array
    }()
}

// TODO: spmor - pass limited info to child controllers (don't use exclusivly extensions for data delegation)

extension HikeViewModel: OverviewDataSource {
    var overviewPdfPath: String {
        return Bundle.main.path(forResource: overviewPdfFilename, ofType: "pdf")!
    }
}

extension HikeViewModel: MapDataSource {
    var plots: [FlowerPlot] {
        return flowerPlots
    }
}

extension HikeViewModel: SpeciesDataSource {
    var species: [String] {
        return ["Flower 1","Flower xyz","Flower abc","Flower 37"]
    }
}
