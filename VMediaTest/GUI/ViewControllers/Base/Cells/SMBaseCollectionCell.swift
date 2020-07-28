//
//  SMBaseCell.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit


class SMBaseCollectionCell: SMCollectionCell {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func awakeFromNib() {
        
        super.awakeFromNib()
    }
    
    override func setupCellData(_ aCellData: SMListCellData) {
        
        super.setupCellData(aCellData)
        
        setupWith(model: aCellData.model)

        if let model: SMBOReloadProtocol = aCellData.model as? SMBOReloadProtocol {
            
            NotificationCenter.default.addObserver(self, selector: #selector(didReceiveReloadNotification), name: NSNotification.Name(rawValue: model.reloadNotificationKey()), object: nil)
        }
    }

    @objc private func didReceiveReloadNotification() {
        
        setupWith(model: cellData?.model)
    }
    
    func setupWith(model aModel: AnyObject?) {
        
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        if  let model: SMBOReloadProtocol = cellData?.model as? SMBOReloadProtocol {
            
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: model.reloadNotificationKey()), object: nil)
        }
    }
}
