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
         plotsFilename: String,
         hikeDisplayName: String) {
        self.overviewPdfFilename = overviewPdfFilename
        self.plotsFilename = plotsFilename
        self.hikeDisplayName = hikeDisplayName
    }
    
    fileprivate var overviewPdfFilename: String
    fileprivate var hikeDisplayName: String
    private var plotsFilename: String
    fileprivate(set) var species: [String] = ["Flower 1","Flower xyz","Flower abc","Flower 37"]
    fileprivate lazy var flowerPlots: [FlowerPlot] = {
        let gpsPlistPath = Bundle.main.path(forResource: self.plotsFilename, ofType: "plist", inDirectory: "")!
        let gpsPlist = NSArray(contentsOfFile: gpsPlistPath)!
        return gpsPlist.map { FlowerPlot(json: $0) }
    }()
}

// TODO: spmor - pass limited info to child controllers (don't use exclusivly extensions for data delegation)

extension HikeViewModel: NavigationBarDataSource {
    var navigationBarTitle: String {
        return hikeDisplayName
    }
}

extension HikeViewModel: OverviewDataSource {
    var overviewPdfPath: String {
        return Bundle.main.path(forResource: overviewPdfFilename, ofType: "pdf")!
    }
}

extension HikeViewModel: MapDataSource {
    var plots: [FlowerPlot] {
        return flowerPlots
    }
    
    var allowShowPlotDetails: Bool {
        return true
    }
}

extension HikeViewModel: SpeciesDataSource {
    
}
