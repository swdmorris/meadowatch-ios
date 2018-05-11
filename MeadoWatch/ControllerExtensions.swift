//
//  ControllerExtensions.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/11/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavigationBarWith(title: String, dismissSelector: Selector? = nil) {
        let item = UINavigationItem(title: title)
        if let dismissSelector = dismissSelector {
            let closeButton = UIBarButtonItem(title: "X", style: .done, target: self, action: dismissSelector)
            item.leftBarButtonItem = closeButton
        }
        navigationController?.navigationBar.items = [item]
    }
}
