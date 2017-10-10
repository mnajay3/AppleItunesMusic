//
//  MusicTableViewCell.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 9/25/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import UIKit
import ProjectWorldFramework

class MusicTableViewCell: MasterTableViewCell {
    
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var trackName: UILabel!
    var imageName: UIImage?
    
    public override func initialize() {
        super.initialize()
    }
    
    override func configureCell(item: Any,tableView: UITableView, indexPath: IndexPath, cell:UITableViewCell) -> UITableViewCell {
        let _tableView = tableView as? MusicTableView
        guard let _item = item as? MusicResults else { return cell }
        self.trackName.text = _item.trackName
        if(_tableView?.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) != nil){
            print("Reusing the image")
            self.imageName = _tableView?.cache.object(forKey: (indexPath.row as AnyObject))! as? UIImage
            self.musicImage.image = self.imageName
        }
        else {
            print("Downloading the image")
            if let _imageURL = (item as! MusicResults).artworkUrl100 {
                    sharedService.getImageData(urlString: _imageURL) { (data) in
                        DispatchQueue.main.async {
                            self.imageName = UIImage(data: data)
                            self.musicImage.image = self.imageName
                            //check the imagename since it is force unwrapping
                            _tableView?.cache.setObject(self.imageName!, forKey: indexPath.row as AnyObject)
                        }
                }
            }
        }
        
        
        
        
        
        
        
        
        
        return self
    }
}
