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
    
    var programItemsDivided: [[SMProgramItem]]?
    var chanels: [SMChannel]?
    
    var custViewController: SMChanelsPresenterProtocol? {
        
        return vc as? SMChanelsPresenterProtocol
    }
    
    override func reloadData() {
        
        super.reloadData()
        
        apply(request: SMCompoundRequest(withRequests: [SMChanelGateway.shared.getChanels(), SMChanelGateway.shared.getProgramItems()])) { [weak self] (aResponse) in
            
            if aResponse.isSuccess {
                
                self?.chanels = aResponse.boArray.first as? [SMChannel]

                self?.programItemsDivided = (aResponse.boArray.last as? [SMProgramItem])?.divide { (pi1, pi2) -> Bool in
                    
                    return pi1.startTime.sm.isEqualToDateIgnoringTime(pi2.startTime)
                }
            }
        }
    }
}
