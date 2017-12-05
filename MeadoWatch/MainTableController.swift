//
//  MainTableController.swift
//  MeadoWatch
//
//  Created by Spencer Morris on 7/9/17.
//  Copyright © 2017 Spencer Morris. All rights reserved.
//

private enum CellIndex: Int {
    case overview = 0
    case map = 1
    case photos = 2
    case flowers = 3
    case booklet = 4
}

import UIKit

class MainTableController: UITableViewController {
    var hikeIndex: Int!
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case CellIndex.overview.rawValue:
            let overviewController = UIStoryboard(name: "Overview", bundle: Bundle.main).instantiateInitialViewController() as! OverviewController
            overviewController.dataSource = AppModel.shared.hikes[hikeIndex]
            navigationController?.pushViewController(overviewController, animated: true)
        case CellIndex.map.rawValue:
            let mapController = UIStoryboard(name: "Map", bundle: Bundle.main).instantiateInitialViewController() as! MapController
            mapController.dataSource = AppModel.shared.hikes[hikeIndex]
            navigationController?.pushViewController(mapController, animated: true)
        case CellIndex.photos.rawValue:
            print("photos")
        case CellIndex.flowers.rawValue:
            print("flowers")
        case CellIndex.booklet.rawValue:
            print("booklet")
        default: break
        }
    }
    
    @IBAction private func otherHikeButtonTapped() {
        tabBarController!.selectedIndex = (tabBarController!.selectedIndex + 1) % 2
    }
}
