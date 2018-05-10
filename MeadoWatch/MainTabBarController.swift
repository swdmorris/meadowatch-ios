//
//  MainTabBarController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/9/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    private lazy var hikeControllers: [HikeTabBarController] = {
        var hikeControllers = [HikeTabBarController]()
        AppModel.shared.hikes.forEach { hikeViewModel in
            let hikeNavigationController = UIStoryboard(name: "HikeTabBarController", bundle: Bundle.main).instantiateInitialViewController() as! UINavigationController
            let hikeController = hikeNavigationController.viewControllers.first as! HikeTabBarController
            hikeController.hike = hikeViewModel
            hikeControllers.append(hikeController)
        }
        return hikeControllers
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        viewControllers = hikeControllers
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        tabBar.isHidden = true
        viewControllers = hikeControllers
    }
}
