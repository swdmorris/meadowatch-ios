//
//  SpeciesListController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/10/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

protocol SpeciesDataSource: class {
    var species: [FlowerSpecies] { get }
}

class SpeciesListController: UIViewController {
    weak var dataSource: SpeciesDataSource!
    
    @IBOutlet fileprivate var tableView: UITableView!
    
}

extension SpeciesListController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "SpeciesCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let species = dataSource.species[indexPath.row]
        cell.textLabel?.text = species.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.species.count
    }
}
