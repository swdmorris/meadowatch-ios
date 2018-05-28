//
//  HikeTabBarController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/9/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

class HikeTabBarController: UITabBarController {
    var hike: HikeViewModel? {
        didSet {
            // TODO: find a way to do this that doesn't lead to huge initial load time
            for controller in viewControllers ?? [] {
                if let mapController = controller as? MapController {
                    mapController.dataSource = hike
                } else if let speciesController = controller as? SpeciesListController {
                    speciesController.dataSource = hike
                } else if let overviewController = controller as? OverviewController {
                    overviewController.dataSource = hike
                } else if let plotListController = controller as? PlotListController {
                    plotListController.dataSource = hike
                } else {
                    fatalError("Unknown controller type - check if controller needs a data source")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBarTitle = hike?.navigationBarTitle ?? "Hike"
        setupNavigationBarWith(title: navBarTitle)
    }
}
