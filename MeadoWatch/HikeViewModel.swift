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
         speciesFilename: String,
         hikeDisplayName: String) {
        self.overviewPdfFilename = overviewPdfFilename
        self.plotsFilename = plotsFilename
        self.speciesFilename = speciesFilename
        self.hikeDisplayName = hikeDisplayName
    }
    
    fileprivate var overviewPdfFilename: String
    fileprivate var hikeDisplayName: String
    private var plotsFilename: String
    private var speciesFilename: String
    fileprivate lazy var flowerPlots: [FlowerPlot] = {
        let gpsPlistPath = Bundle.main.path(forResource: self.plotsFilename, ofType: "plist", inDirectory: "")!
        let gpsPlist = NSArray(contentsOfFile: gpsPlistPath)!
        return gpsPlist.map { FlowerPlot(json: $0) }
    }()
    fileprivate(set) lazy var species: [FlowerSpecies] = {
        let speciesPlistPath = Bundle.main.path(forResource: self.speciesFilename, ofType: "plist", inDirectory: "")!
        let speciesPlist = NSArray(contentsOfFile: speciesPlistPath)!
        return speciesPlist.map { FlowerSpecies(json: $0) }
    }()
    
    func viewModelForPlot(_ plot: FlowerPlot) -> PlotViewModel? {
        let plotSpecies = species.filter { plot.speciesIds.contains($0.id) }
        return PlotViewModel(plot: plot, species: plotSpecies)
    }
}

// TODO: spmor - pass limited info to child controllers (don't use exclusivly extensions for data delegation)

extension HikeViewModel: PlotListDataSource {
    var plots: [FlowerPlot] {
        return flowerPlots
    }
}

extension HikeViewModel: MapDataSource {
    var allowShowPlotDetails: Bool {
        return true
    }
}

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

extension HikeViewModel: SpeciesDataSource {
    
}
