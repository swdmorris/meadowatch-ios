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
}

import UIKit

class MainTableController: UITableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case CellIndex.overview.rawValue:
            print("overview")
        case CellIndex.map.rawValue:
            print("map")
        case CellIndex.photos.rawValue:
            print("photos")
        case CellIndex.flowers.rawValue:
            print("flowers")
        default: break
        }
    }
}
