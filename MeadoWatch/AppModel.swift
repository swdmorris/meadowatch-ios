//
//  AppModel.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/25/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

protocol NavigationBarDataSource {
    var navigationBarTitle: String { get }
}

class AppModel {
    private init() { }
    
    static let shared = AppModel()
    
    private(set) lazy var hikes: [HikeViewModel] = { return [self.reflectionLakesHike, self.glacierBasinHike] }()
    
    private lazy var reflectionLakesHike: HikeViewModel = {
        
        let hike = HikeViewModel(
            overviewPdfFilename: "ReflectionLakes_FinalBooklet",
            plotsFilename: "ReflectionLakesPlots",
            hikeDisplayName: "Reflection Lakes")
        return hike
    }()
    
    private lazy var glacierBasinHike: HikeViewModel = {
        let hike = HikeViewModel(
            overviewPdfFilename: "GlacierBasin_FinalBooklet",
            plotsFilename: "GlacierBasinPlots",
            hikeDisplayName: "Glacier Basin")
        return hike
    }()
}
