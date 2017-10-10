//
//  MasterViewController.swift
//  ProjectWorldFramework
//
//  Created by Naga Murala on 9/27/17.
//  Copyright © 2017 Naga Murala. All rights reserved.
//

import Foundation
import UIKit

open class MasterViewController: UIViewController {
    //MARK: Property declaration
    open var _config: [String: Any]?
    open var _nextViewName: String?
    open var _nextstoryBoard: String?
    open var _destinationVC: UIViewController?
    public typealias completionBlock = (() -> Void)
    
    //MARK:- Property Observers
    //Please make sure to set pageName adn segueAlias in every controller to have the page navigation properly
    public var pageName = EMPTY_STRING {
        didSet {
            if !self.segueAlias.isEmpty {
                loadConfigurations()
            }
        }
    }
    public var segueAlias = EMPTY_STRING {
        didSet {
            if !self.pageName.isEmpty {
                loadConfigurations()
            }
        }
    }
    
    //MARK:- Overriden methods
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.loadConfigurations()
    }
    
    //MARK:- Navingation&Presentation handlers
    //method is used to initialize the destination storyboard with view controller
    public func initializeSceneConfig(bundle: Bundle?) {
        if _nextstoryBoard == nil { return }
        if _nextViewName == nil { return }
        let storyBoard = UIStoryboard(name: _nextstoryBoard!, bundle: bundle)
        _destinationVC = storyBoard.instantiateViewController(withIdentifier: _nextViewName!)
    }
    //Make sure to use this method after the initializeSceneConfig() in sequence to present VC
    public func presentScene(bundle: Bundle?) {
        if _destinationVC == nil { return }
        self.present(_destinationVC!, animated:true){
            //NOOP: Eg: trigger NSNotifications to the destination view
        }
    }
    //Make sure to use this method after the initializeSceneConfig() in sequence to navigate VC
    public func navigateToScene(){
        if _destinationVC == nil { return }
        self.navigationController?.pushViewController(_destinationVC!, animated: true)
    }
    
    //MARK:- PLIST configurations
    //The follwing method is used to configure data from plist file. The method invokes on viewdidload and assign all page configurations to _config object.
    //Then it fetch all pageconfigurations for UI page navigation
    //Not inteded to allow access from outside
    private func loadConfigurations() {
        //Load any configuration that may be in the context
        if self.pageName.isEmpty { return }
        if self.segueAlias.isEmpty { return }
        //Load the configuration in the page
        _config = masterPropertyManager.loadPageConfigurationsFor(self.pageName)
        (_nextViewName, _nextstoryBoard) = masterPropertyManager.loadSegueDetailsFromPageConfig(pageConfig: _config, segueAlias: segueAlias)
    }
    
}
