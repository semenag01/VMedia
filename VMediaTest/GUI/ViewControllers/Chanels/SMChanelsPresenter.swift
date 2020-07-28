//
//  SMChanelsPresenter.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import VRGSoftSwiftIOSKit

protocol SMChanelsPresenterProtocol {
    
}

final class SMChanelsPresenter: SMBasePresenter {
    
    var custViewController: SMChanelsPresenterProtocol? {
        
        return vc as? SMChanelsPresenterProtocol
    }
}
