//
//  OverviewController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/9/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import UIKit

protocol OverviewDataSource: class {
    var overviewPdfPath: String { get }
}

class OverviewController: UIViewController {
    weak var dataSource: OverviewDataSource!
    
    @IBOutlet private weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webview.loadRequest(URLRequest(url: URL(fileURLWithPath: dataSource.overviewPdfPath)))
    }
}
