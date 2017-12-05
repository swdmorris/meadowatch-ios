//
//  PlotController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 12/4/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import UIKit

extension UIViewController {
    func showDetails(for plot: FlowerPlot) {
        let plotController = PlotController.create(with: plot)
        navigationController?.pushViewController(plotController, animated: true)
    }
}

class PlotController: UIViewController {
    private var plot: FlowerPlot!
    
    static func create(with plot: FlowerPlot) -> PlotController {
        // TODO: create plot controller from storyboard
        let plotController = PlotController()
        plotController.plot = plot
        return plotController
    }
}
