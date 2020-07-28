//
//  SMBaseModelTableViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit

class SMBaseModelTableViewController: SMBaseTableViewController, SMBaseModuleListPresenterProtocol, SMListAdapterDelegate, SMListDisposerModeledDelegate {
    
    var listDisposerModeled: SMListDisposerSetupModelProtocol? { return listDisposer as? SMListDisposerSetupModelProtocol }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        (presenter as? SMBaseModuleListPresenter)?.setupListAdapter(createListAdapter())
    }
    
    override func createListDisposer() -> SMListDisposer {
        
        let result: SMTableDisposerModeled = SMTableDisposerModeled()
        
        result.modeledDelegate = self
        
        return result
    }
    
    func createListAdapter() -> SMListAdapter {
        
        guard let tableDisposer: SMTableDisposerModeled = tableDisposer as? SMTableDisposerModeled else {
            
            assert(true, #function + " collectionDisposer is not SMCollectionDisposerModeled class")
            return SMTableAdapter(listDisposer: SMTableDisposerModeled())
        }
        
        let result: SMTableAdapter = SMTableAdapter(listDisposer: tableDisposer)
        
        result.delegate = self
        
        return result
    }
    
    
    // MARK: SMListAdapterDelegate
    
    func listAdapter(_ aListAdapter: SMListAdapter, sectionForModels aModels: [AnyObject], indexOfSection aIndex: Int) -> SMListSection? {
       
        return nil
    }
    
    func listDisposer(_ aListDisposer: SMListDisposer, cellDataClassForUnregisteredModel aModel: AnyObject) -> SMListCellData.Type {
        
        return SMListCellData.self
    }

    func defaultSectionForlistAdapter(_ aListAdapter: SMListAdapter) -> SMListSection? {
        
        return SMSectionReadonly()
    }
    
    func prepareSectionsFor(listAdapter aListAdapter: SMListAdapter) {
        
        tableDisposer?.sections.removeAll()
    }
    
    func moreCellDataForListAdapter(_ aListAdapter: SMListAdapter) -> SMPagingMoreCellDataProtocol? {
        
        return SMNativeMoreTableViewCellData()
    }
    
    func listAdapter(_ aListAdapter: SMListAdapter, needAddModels aModels: [AnyObject], toSection aSection: SMListSection, withLastModel aLastModel: AnyObject) -> Bool {
        return true
    }
    
    
    // MARK: SMListDisposerModeledCreateCellDataDelegate
    
    func listDisposer(_ aListDisposer: SMListDisposer, didCreateCellData aCellData: SMListCellData) {
        
    }
    
    
    // MARK: UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return nil
    }
}
