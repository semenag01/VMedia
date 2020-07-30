//
//  SMChannelsViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//


import VRGSoftSwiftIOSKit

final class SMChannelsViewController: SMBaseCollectionViewController {

    static let minutesInPixel: Int = 7
    static let cellHeight: Int = 40

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
    
    override func configureListView() {
        
        super.configureListView()
        
        listView?.delaysContentTouches = true
        listView?.showsVerticalScrollIndicator = true
    }
    
    override func configureListDisposer() {
        
        super.configureListDisposer()

        collectionView?.register(UINib(nibName: SMChannelCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMChannelCellData.self))

        collectionView?.register(UINib(nibName: SMTimeCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMTimeCellData.self))

        collectionView?.register(UINib(nibName: SMProgramCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMProgramCellData.self))

        collectionView?.register(UINib(nibName: SMEmptyCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMEmptyCellData.self))
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
        
        let width: CGFloat = CGFloat(interval * SMChannelsViewController.minutesInPixel + SMChannelCellData.cellWidth)
        listView?.sm.width = width
                
        (self.view as? UIScrollView)?.contentSize = CGSize(width: width, height: self.listView?.sm.height ?? 0)
    }
}
