//
//  PlotViewModel.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/11/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import Foundation

class PlotViewModel {
    init(plot: FlowerPlot,
         species: [FlowerSpecies]) {
        self.plot = plot
        self.species = species
    }
    
    fileprivate var plot: FlowerPlot
    fileprivate(set) var species: [FlowerSpecies]
}

extension PlotViewModel: NavigationBarDataSource {
    var navigationBarTitle: String {
        return "Plot \(plot.plotNumber)"
    }
}

extension PlotViewModel: MapDataSource {
    var plots: [FlowerPlot] {
        return [plot]
    }
    
    var allowShowPlotDetails: Bool {
        return false
    }
    
    func viewModelForPlot(_ plot: FlowerPlot) -> PlotViewModel? {
        return nil
    }
}

extension PlotViewModel: OverviewDataSource {
    var overviewPdfPath: String {
        return Bundle.main.path(forResource: plot.overviewPdfFilename, ofType: "pdf")!
    }
}

extension PlotViewModel: SpeciesDataSource {
    
}
