//
//  HikeViewModel.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/9/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

import MapKit

class HikeViewModel {
    init(overviewHTMLFilename: String,
         gpsPointsFilename: String) {
        overviewHTMLPath = Bundle.main.path(forResource: overviewHTMLFilename, ofType: "html", inDirectory: "")!
        self.gpsPointsFilename = gpsPointsFilename
    }
    
    fileprivate var overviewHTMLPath: String
    
    private var gpsPointsFilename: String
    fileprivate lazy var plotPoints: [CLLocation] = {
        let gpsPlist = Bundle.main.path(forResource: self.gpsPointsFilename, ofType: "plist", inDirectory: "")!
        // TODO
        return []
    }()
}

extension HikeViewModel: OverviewDataSource {
    var overviewHTML: Data {
        let url = URL(fileURLWithPath: overviewHTMLPath)
        return try! Data(contentsOf: url)
    }
}

extension HikeViewModel: MapDataSource {
    var gpsPoints: [CLLocation] {
        return plotPoints
    }
}
