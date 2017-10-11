//
//  MusicInfoDetailViewController.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 10/10/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import ProjectWorldFramework

class MusicInfoDetailViewController: MasterViewController, MasterItemDelegate {
    
    @IBOutlet weak var musicDetailTV: MusicInfoDetail!
    var delegate : MusicTableViewController?
    var selectedItem: MusicResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musicDetailTV.itemDelegate = self
        self.setSelectedTrackData()
        
    }
    
    func itemSelected(_ sender: Any, item: Any, itemIdentifier: String?, indexPath: IndexPath) {
        //NOOP
    }
    
    func setSelectedTrackData() {
        
            //Even if you want to print some test data, setting up the list is mandatory.
            //The list values are in the form of [Int:[Any]]
//            self.musicDetailTV.list = [0:[selectedItem]]
            self.populateTrackDetails()
            //Make sure to set the sections, even if you don't have any specific section have it empty.
            self.musicDetailTV.sections = ["Track Detail"]
        
        
    }
    
    func populateTrackDetails()  {
        var list : [Any] = [Any]()
        if self.selectedItem != nil  {
            var trackDetail:[String:AnyObject] = [String:AnyObject]()
            trackDetail["ArtistID"] = self.selectedItem?.artistId as AnyObject
            trackDetail["ArtistName"] = self.selectedItem?.artistName as AnyObject
            trackDetail["Collection Price"] = self.selectedItem?.collectionPrice as AnyObject
            trackDetail["Country"] = self.selectedItem?.country as AnyObject
            trackDetail["Currency"] = self.selectedItem?.currency as AnyObject
            trackDetail["Disc Count"] = self.selectedItem?.discCount as AnyObject
            trackDetail["Disc Number"] = self.selectedItem?.discNumber as AnyObject
            trackDetail["Kind"] = self.selectedItem?.kind as AnyObject
            trackDetail["Genre Name"] = self.selectedItem?.primaryGenreName as AnyObject
            trackDetail["Track Name"] = self.selectedItem?.trackName as AnyObject
            trackDetail["Track ID"] = self.selectedItem?.trackId as AnyObject
            trackDetail["Track Price"] = self.selectedItem?.trackPrice as AnyObject
            for detail in trackDetail {
                list.append(detail as Any)
            }
            self.musicDetailTV.list = [0:list]
            self.musicDetailTV.reloadData()
            
            
            
            
            
            
            
        
//        let trackDetails = [self.selectedItem?.artistId ?? "N/A"
//            ,self.selectedItem?.artistName ?? "Not Available",self.selectedItem?.collectionPrice ?? "Not Available", self.selectedItem?.country ?? "Not Available",self.selectedItem?.currency ?? "Not Available",self.selectedItem?.discCount ?? "$0.00", self.selectedItem?.discNumber ?? "N/A", self.selectedItem?.kind ?? "Not Available",self.selectedItem?.primaryGenreName ?? "Not Available", self.selectedItem?.trackName ?? "Not Available", self.selectedItem?.trackId ?? "Not Available",self.selectedItem?.trackPrice ?? "Free"] as? [String]
//            for (index, item) in trackDetails.enumerated() {
//                self.musicDetailTV.list[0] = item
//            }
            
        }
        
    }
}
