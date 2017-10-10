//
//  MusicTableViewController.swift
//  SearchYourFavoriteMusic
//
//  Created by Naga Murala on 9/19/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import UIKit
import ProjectWorldFramework

class MusicTableViewController : MasterViewController, UISearchResultsUpdating, MasterItemDelegate {
    
    @IBOutlet var mainTableView: MusicTableView!
    
    
    var filteredResponse = [Int: [Any]]()
    var searchController: UISearchController!
    //commented the following is to display the search results in same table view controller
//    var resultViewController = UITableViewController()
    var masterList = [Int: [Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        setSearchBarToTableView()
        //Service call
        sharedService.getMusicData(urlString: "", block: {
            print("Hi: I am block")
        }) { (data) in
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as! JSON
                let modelObj = MusicBaseInfo(json: json)
                guard let _modelObj = modelObj.results else { return }
                self.mainTableView.list = [0: _modelObj]
                self.mainTableView.sections = ["Music PlayList"]
                self.masterList = [0: _modelObj]
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
                
            } catch  {
                print("error")
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    func initialize() {
        //delegating to confirm all actions take place in the table view
        self.mainTableView.itemDelegate = self
        
        //delegating to confirm all actions take place in searchbar to the mainTableView again
        //This is crucial part of call to invoke mantable view for the actions in searchbar table view
        //we are giving the delegate and datasource from mainTableView since mainTableView is confirming actual tableview
        //datasource and delegate methods..
//        self.resultViewController.tableView.dataSource = self.mainTableView.self
//        self.resultViewController.tableView.delegate = self.mainTableView.self
    }
    func setSearchBarToTableView() {
//        self.searchController = UISearchController(searchResultsController: self.resultViewController)
        self.searchController = UISearchController(searchResultsController: nil)
        //ContentOffset is to set the table view header coordinates.
        //In this context to make the search bar hide by default. User needs to scroll down to see the search bar for first time
        DispatchQueue.main.async {
            self.mainTableView.contentOffset = CGPoint(x: 0, y: -20)
        }
        //Set the searchbar to the tableview header
        self.mainTableView.tableHeaderView = self.searchController.searchBar
        //Provide the delegate control to search bar
        self.searchController.searchResultsUpdater = self
        //It avoids the dimness when we click on searchbar
        self.searchController.dimsBackgroundDuringPresentation = false
        //It removes an extra empty space in table view when we enter any search keyword in searchbar
        definesPresentationContext = true
    }
    func itemSelected(_ sender: Any, item: Any, itemIdentifier: String?, indexPath: IndexPath) {
        //NOOP
    }
    
    //MARK:- UISearchResultsUpdating delegate method
    func updateSearchResults(for searchController: UISearchController) {
        var internalFilter:[Any]?
        for index in 0..<(self.mainTableView.sections?.count)! {
            internalFilter = self.masterList[index]?.filter({ (data) -> Bool in
                if let _data = data as? MusicResults {
                    //Null check for track name
                    return _data.trackName!.lowercased().contains(searchController.searchBar.text!.lowercased())
                }
                return false
            })
            //Updating the filtered response dictionary by setting matched values to set in the table later
            self.filteredResponse.updateValue(internalFilter!, forKey: index)
        }
        
        //        return data.lowercased().contains(searchController.searchBar.text!.lowercased())
        if(!searchController.searchBar.text!.isEmpty) {
            self.mainTableView.list = self.filteredResponse
        }else {
            //null check the masterList since it is force unwrapping..
            self.mainTableView.list = self.masterList
        }
//        self.resultViewController.tableView.reloadData()
        self.mainTableView.reloadData()
        
    }
}
