//
//  HikeSpeciesController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/10/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

protocol SpeciesDataSource: class {
    var species: [FlowerSpecies] { get }
}

class HikeSpeciesController: UIViewController {
    weak var dataSource: SpeciesDataSource!
    
}
