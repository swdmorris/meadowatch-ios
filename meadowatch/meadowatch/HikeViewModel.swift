//
//  HikeViewModel.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/9/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import Foundation

class HikeViewModel {
    
}

extension HikeViewModel: HikeOverviewDataSource {
    var overviewHTML: Data {
        let path = Bundle.main.path(forResource: "glacier_basin_overview", ofType: "html", inDirectory: "")
        let url = URL(fileURLWithPath: path!)
        return try! Data(contentsOf: url)
    }
}
