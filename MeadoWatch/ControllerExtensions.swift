//
//  ControllerExtensions.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/11/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

extension UIViewController {
    func setupNavigationBarWith(title: String, dismiss: (target: Any, selector: Selector)? = nil) {
        let item = UINavigationItem(title: title)
        if let dismiss = dismiss {
           let closeButton = UIBarButtonItem(title: "X", style: .done, target: dismiss.target, action: dismiss.selector)
            item.leftBarButtonItem = closeButton
        }
        navigationController?.navigationBar.items = [item]
    }
}
