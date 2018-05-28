//
//  SpeciesViewModel.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/28/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import Foundation

class SpeciesViewModel {
    private(set) var species: FlowerSpecies
    
    init(species: FlowerSpecies) {
        self.species = species
    }
}

extension SpeciesViewModel: OverviewDataSource {
    var overviewPdfPath: String {
        return Bundle.main.path(forResource: species.overviewPdfFilename, ofType: "pdf")!
    }
}
