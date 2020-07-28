//
//  SMBaseModelCollectionViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit

class SMBaseModelCollectionViewController: SMBaseCollectionViewController, SMBaseModuleListPresenterProtocol, SMListAdapterDelegate, SMListDisposerModeledDelegate {
    
    var listDisposerModeled: SMListDisposerSetupModelProtocol? { return listDisposer as? SMListDisposerSetupModelProtocol }

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        (presenter as? SMBaseModuleListPresenter)?.setupListAdapter(createListAdapter())
    }
    
    override func createListDisposer() -> SMListDisposer {
        
        let result: SMCollectionDisposerModeled = SMCollectionDisposerModeled()
        
        result.modeledDelegate = self
        
        return result
    }
    
    func createListAdapter() -> SMListAdapter {
        
        guard let collectionDisposer: SMCollectionDisposerModeled = collectionDisposer as? SMCollectionDisposerModeled else {
            
            assert(true, #function + " collectionDisposer is not SMCollectionDisposerModeled class")
            return SMCollectionAdapter(listDisposer: SMCollectionDisposerModeled())
        }
        
        let result: SMCollectionAdapter = SMCollectionAdapter(listDisposer: collectionDisposer)
        
        result.delegate = self
        
        return result
    }
    
    
    // MARK: SMListAdapterDelegate
    
    func listAdapter(_ aListAdapter: SMListAdapter, sectionForModels aModels: [AnyObject], indexOfSection aIndex: Int) -> SMListSection? {
        return nil
    }
    
    func listAdapter(_ aListAdapter: SMListAdapter, needAddModels aModels: [AnyObject], toSection aSection: SMListSection, withLastModel aLastModel: AnyObject) -> Bool {
        return true
    }
    
    func listDisposer(_ aListDisposer: SMListDisposer, cellDataClassForUnregisteredModel aModel: AnyObject) -> SMListCellData.Type {
        
        return SMListCellData.self
    }
    
    func defaultSectionForlistAdapter(_ aListAdapter: SMListAdapter) -> SMListSection? {
        
        return SMCollectonSection()
    }
    
    func prepareSectionsFor(listAdapter aListAdapter: SMListAdapter) {
        
        collectionDisposer?.sections.removeAll()
        collectionDisposer?.reloadData()
    }
    
    func moreCellDataForListAdapter(_ aListAdapter: SMListAdapter) -> SMPagingMoreCellDataProtocol? {
        
        let cd: SMNativeMoreCollectionViewCellData = SMNativeMoreCollectionViewCellData()
		cd.cellSize = CGSize(width: view.sm.width - 16, height: 100)
        
        return cd
    }
    
    func listDisposer(_ aListDisposer: SMListDisposer, didCreateCellData aCellData: SMListCellData) {
        
    }
    func collectionDisposer(_ aCollectionDisposer: SMCollectionDisposer, didCreateCellData aCellData: SMCollectionCellData) {
        
    }
}
