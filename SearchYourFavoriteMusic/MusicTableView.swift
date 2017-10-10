//
//  MusicTableView.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 9/25/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import UIKit
import ProjectWorldFramework

class MusicTableView: MasterTableView {
    
    var imageName: UIImage?
    //The reason declaring cache in tableview instead of in tableviewcell is, we are losing the data in cache every time scroll up the cells in table view, since the relation ship of tableview and table view cell is through configureCell method.
    var cache: NSCache<AnyObject, AnyObject>!
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func initialize() {
        super.initialize()
        cache = NSCache()
        let factory = self.cellFactory
        factory.cellCreator = creatTVC
    }
    
    public func creatTVC(item: Any, indexPath: IndexPath) -> UITableViewCell {
        let _cell  = dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MusicTableViewCell
        if imageName != nil {
            _cell.imageName = imageName
        }
        return  _cell.configureCell(item: item,tableView: self, indexPath: indexPath, cell: _cell)
    }
    
}
