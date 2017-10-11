//
//  MusicInfoDetailTVCell.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 10/10/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import ProjectWorldFramework

class MusicInfoDetailTVCell: MasterTableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var value: UILabel!
    
    override func initialize() {
        super.initialize()
    }
    
    override func configureCell(item: Any?, tableView: UITableView, indexPath: IndexPath, cell: UITableViewCell) -> UITableViewCell {
        guard item != nil else { return cell }
        let _item = item as! (key:String,value: AnyObject)
        self.name.text = "\(_item.key): "
        self.value.text = "\(_item.value)"
//        cell.description = _item.value as! String
        
        return cell
    }
}
