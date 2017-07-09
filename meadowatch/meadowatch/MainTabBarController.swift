//
//  MainTabBarController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/9/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewControllers = viewControllers,
            let reflectionLakesNavigationController = viewControllers[0] as? UINavigationController,
            let reflectionLakesController = reflectionLakesNavigationController.viewControllers[0] as? MainTableController,
            let glacierBasinNavigationController = viewControllers[1] as? UINavigationController,
            let glacierBasinController = glacierBasinNavigationController.viewControllers[0] as? MainTableController else {
                fatalError("MainTabBar.storyboard not properly configured with MainTabBarController")
        }
        // TODO: setup controllers with data
        reflectionLakesController.title = "Reflection Lakes"
        glacierBasinController.title = "Glacier Basin"
    }
}

