//
//  MusicInfoDetail.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 10/10/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import ProjectWorldFramework

class MusicInfoDetail: MasterTableView {
    
    override func initialize() {
        super.initialize()
        let _cellFactory = self.cellFactory
        _cellFactory.cellCreator = creatTVC
    }
    
    func creatTVC(item: Any, indexPath: IndexPath) -> UITableViewCell {
        var _cell = self.dequeueReusableCell(withIdentifier: "cell") as! MusicInfoDetailTVCell
        
        _cell = _cell.configureCell(item: item, tableView: self, indexPath: indexPath, cell: _cell) as! MusicInfoDetailTVCell
        return _cell
    }
}
