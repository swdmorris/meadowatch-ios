//
//  PlotDetailsTabBarController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/11/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

extension UIViewController {
    func showDetails(for plot: FlowerPlot, species: [FlowerSpecies]) {
        let plotController = PlotDetailsTabBarController.create(with: plot, species: species)
        present(plotController, animated: true)
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
                } else {
                    fatalError("Unknown controller type - check if controller needs a data source")
                }
            }
        }
    }
    
    static func create(with plot: FlowerPlot, species: [FlowerSpecies]) -> UINavigationController {
        let plotNavigationController = UIStoryboard(name: "PlotDetails", bundle: Bundle.main).instantiateInitialViewController() as! UINavigationController
        let plotController = plotNavigationController.viewControllers.first as! PlotDetailsTabBarController
        let viewModel = PlotViewModel(plot: plot, species: species)
        plotController.viewModel = viewModel
        return plotNavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBarTitle = viewModel?.navigationBarTitle ?? "Plot"
        setupNavigationBarWith(title: navBarTitle, dismiss: (self, #selector(closeButtonPressed)))
    }
    
    func closeButtonPressed() {
        navigationController?.dismiss(animated: true)
    }
}
