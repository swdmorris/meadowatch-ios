//
//  PlotDetailsTabBarController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/11/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

extension UIViewController {
    func showDetails(for viewModel: PlotViewModel) {
        let plotController = PlotDetailsTabBarController.create(with: viewModel)
        present(plotController, animated: true)
    }
}

class PlotDetailsTabBarController: UITabBarController {
    var viewModel: PlotViewModel? {
        didSet {
            for controller in viewControllers ?? [] {
                if let mapController = controller as? MapController {
                    mapController.dataSource = viewModel
                } else if let speciesController = controller as? SpeciesListController {
                    speciesController.dataSource = viewModel
                } else if let overviewController = controller as? OverviewController {
                    overviewController.dataSource = viewModel
                } else {
                    fatalError("Unknown controller type - check if controller needs a data source")
                }
            }
        }
    }
    
    static func create(with viewModel: PlotViewModel) -> UINavigationController {
        let plotNavigationController = UIStoryboard(name: "PlotDetails", bundle: Bundle.main).instantiateInitialViewController() as! UINavigationController
        let plotController = plotNavigationController.viewControllers.first as! PlotDetailsTabBarController
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
