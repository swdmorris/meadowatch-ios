//
//  PlotListController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 5/14/18.
//  Copyright © 2018 Spencer Morris. All rights reserved.
//

import UIKit

protocol PlotListDataSource: SpeciesDataSource {
    var plots: [FlowerPlot] { get }
    func viewModelForPlot(_ plot: FlowerPlot) -> PlotViewModel?
}

class PlotListController: UIViewController {
    weak var dataSource: PlotListDataSource!
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView(frame: .zero)
        }
    }
    
    fileprivate func plot(for indexPath: IndexPath) -> FlowerPlot? {
        return dataSource.plots.count > indexPath.row ? dataSource.plots[indexPath.row] : nil
    }
}

extension PlotListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let plot = plot(for: indexPath) else {
            fatalError("Attempted to access plot (\(indexPath.row) beyond index path of available plots (\(dataSource.plots.count)")
        }
        if let viewModel = dataSource.viewModelForPlot(plot) {
            showDetails(for: viewModel)
        }
    }
}

extension PlotListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "PlotCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        guard let plot = plot(for: indexPath) else {
            fatalError("Attempted to access plot (\(indexPath.row) beyond index path of available plots (\(dataSource.plots.count)")
        }
        cell.textLabel?.text = plot.displayName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.plots.count
    }
}
