//
//  MasterTableView.swift
//  ProjectWorldFramework
//
//  Created by Naga Murala on 9/27/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import UIKit

//Protocol is to handle DidSelectRowAt index path delegate method
public protocol MasterItemDelegate {
    func itemSelected(_ sender: Any, item: Any, itemIdentifier: String?, indexPath: IndexPath)
}

//CellFactory to customize UITableViewCell.
public class MasterTableViewCellFactory: NSObject {
    //assign method from your child classes
    public var cellCreator: ((Any, IndexPath) -> UITableViewCell)?
    public override init() {
        super.init()
    }
    public init(cellCreator: @escaping (Any, IndexPath) -> UITableViewCell) {
        self.cellCreator = cellCreator
    }
    
    public func createCell(item:Any, indexPath:IndexPath) -> UITableViewCell {
        guard let _create = cellCreator else { return UITableViewCell() }
        return _create(item, indexPath)
    }
}

open class MasterTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    //Make sure to set the sections, even if you don't have any specific section have it empty.
    public var sections:[String]? = [String]()
    
    //Even if you want to print some test data, setting up the list is mandatory.
    //The list values are in the form of [Int:[Any]]
    public var list:[Int:[Any]] = [Int:[Any]]()
    
    //It plays the vital role to transition the page from one view to the other view
    public var itemDelegate: MasterItemDelegate?
    //It needs to be set in table view viewdidload method to create a cell and set the table data
    public var cellFactory = MasterTableViewCellFactory()
    
    override public init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    open func initialize() {
        self.delegate = self
        self.dataSource = self
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = self.sections?.count else {
            return 0
        }
        return sections
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let noOfRowsInSec = self.list[section]{
            return noOfRowsInSec.count
        }
        return 0
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionName = self.sections?[section] else { return nil }
        return sectionName
    }
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = (self.list[indexPath.section]?[indexPath.row]) else { return UITableViewCell() }
        //Make sure to initialize cellCreator from child class, before createcell is getting invoked
        return self.cellFactory.createCell(item: item, indexPath:indexPath)
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = (self.list[indexPath.section]?[indexPath.row]) else { return }
        guard let identifier = cellForRow(at: indexPath)?.description else { return }
        guard let _itemDelegate = self.itemDelegate else { return }
        //Calls the delegate method in protocol confirmed class
        _itemDelegate.itemSelected(self, item: item, itemIdentifier: identifier, indexPath: indexPath)
    }
}
