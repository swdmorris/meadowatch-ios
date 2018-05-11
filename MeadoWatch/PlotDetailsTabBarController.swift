//
//  PlotDetailsTabBarController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/11/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

extension UIViewController {
    func showDetails(for plot: FlowerPlot, species: [String]) {
        let plotController = PlotDetailsTabBarController.create(with: plot, species: species)
        navigationController?.pushViewController(plotController, animated: true)
    }
}

class PlotDetailsTabBarController: UITabBarController {
    var viewModel: PlotViewModel? {
        didSet {
            for controller in viewControllers ?? [] {
                if let mapController = controller as? MapController {
                    mapController.dataSource = viewModel
                } else if let speciesController = controller as? HikeSpeciesController {
                    speciesController.dataSource = viewModel
                } else if let overviewController = controller as? OverviewController {
                    overviewController.dataSource = viewModel
                }
            }
        }
    }
    
    static func create(with plot: FlowerPlot, species: [String]) -> PlotDetailsTabBarController {
        // TODO: create plot controller from storyboard
        let plotController = PlotDetailsTabBarController()
        let viewModel = PlotViewModel(plot: plot, species: species)
        plotController.viewModel = viewModel
        return plotController
    }
}
