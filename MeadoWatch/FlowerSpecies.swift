//
//  FlowerSpecies.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/14/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import Foundation

struct FlowerSpecies {
    init(json: Any) {
        let jsonDictionary = json as! [String : Any]
        id = jsonDictionary["id"] as! String
        name = jsonDictionary["name"] as! String
        overviewPdfFilename = jsonDictionary["overviewPdfFilename"] as! String
    }
    
    private(set) var id: String
    private(set) var name: String
    private(set) var overviewPdfFilename: String
}
