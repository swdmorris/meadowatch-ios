//
//  AppModel.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/25/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

class AppModel {
    private init() { }
    
    static let shared = AppModel()
    
    private(set) lazy var hikes: [HikeViewModel] = { return [self.reflectionLakesHike, self.glacierBasinHike] }()
    
    private lazy var reflectionLakesHike: HikeViewModel = {
        
        let hike = HikeViewModel(
            overviewHTMLFilename: "reflection_lakes_overview",
            gpsPointsFilename: "ReflectionLakesGPS")
        return hike
    }()
    
    private lazy var glacierBasinHike: HikeViewModel = {
        let hike = HikeViewModel(
            overviewHTMLFilename: "glacier_basin_overview",
            gpsPointsFilename: "GlacierBasinGPS")
        return hike
    }()
}
