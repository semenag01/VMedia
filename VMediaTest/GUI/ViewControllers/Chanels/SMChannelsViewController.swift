//
//  SMChannelsViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//


import VRGSoftSwiftIOSKit

let kSMOneMinutesInPixel: Int = 10

final class SMChannelsViewController: SMBaseCollectionViewController {
    
    override func createPresenter() -> SMBasePresenter {
        
        let result: SMChannelsPresenter = SMChannelsPresenter(vc: self)
        
        return result
    }
    
    var custPresenter: SMChannelsPresenter? {
        
        return presenter as? SMChannelsPresenter
    }
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        prepareLocalization()
    }
    
    
    // MARK: Base Overrides
    
    override func configureListDisposer() {
        
        super.configureListDisposer()

        collectionView?.register(UINib(nibName: SMChannelCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMChannelCellData.self))

        collectionView?.register(UINib(nibName: SMTimeCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMTimeCellData.self))

        collectionView?.register(UINib(nibName: SMProgramCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMProgramCellData.self))
    }
    
    // MARK: Logic
    
    
    // MARK: Actions
    
    
    // MARK: Localization
    
    override func prepareLocalization() {
        
    }
}


// MARK: SMChannelsPresenterProtocol

extension SMChannelsViewController: SMChannelsPresenterProtocol {
    
    func willReloadWithInterval(_ interval: Int) {
        
        listView?.sm.width = CGFloat(interval * kSMOneMinutesInPixel + 100)
    }
}
