//
//  SMChanelsViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//


import VRGSoftSwiftIOSKit

final class SMChanelsViewController: SMBaseCollectionViewController {
    
    override func createPresenter() -> SMBasePresenter {
        
        let result: SMChanelsPresenter = SMChanelsPresenter(vc: self)
        
        return result
    }
    
    var custPresenter: SMChanelsPresenter? {
        
        return presenter as? SMChanelsPresenter
    }
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        prepareLocalization()
    }
    
    
    // MARK: Base Overrides
    
    
    // MARK: Logic
    
    
    // MARK: Actions
    
    
    // MARK: Localization
    
    override func prepareLocalization() {
        
    }
}


// MARK: SMChanelsPresenterProtocol

extension SMChanelsViewController: SMChanelsPresenterProtocol {
    
    
}
