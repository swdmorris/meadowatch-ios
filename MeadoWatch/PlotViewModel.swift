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
         species: [String]) {
        self.plot = plot
        self.species = species
    }
    
    fileprivate var plot: FlowerPlot
    fileprivate(set) var species: [String]
}

extension PlotViewModel: MapDataSource {
    var plots: [FlowerPlot] {
        return [plot]
    }
    
    var allowShowPlotDetails: Bool {
        return false
    }
}

extension PlotViewModel: OverviewDataSource {
    var overviewPdfPath: String {
        return plot.overviewPdfFilename
    }
}

extension PlotViewModel: SpeciesDataSource {
    
}
