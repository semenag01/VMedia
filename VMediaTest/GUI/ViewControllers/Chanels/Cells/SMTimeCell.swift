//
//  SMTimeCell.swift
//  VMediaTest
//
//  Created by OLEKSANDR SEMENIUK on 29.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.


import VRGSoftSwiftIOSKit

class SMTimeCellData: SMCollectionCellData {
    
    override class var cellNibName_: String? {
        
        let result: String = String(describing: SMTimeCell.self)
        
        return result
    }
}

class SMTimeCell: SMBaseCollectionCell {
 
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .red
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
    }
    
    
    // MARK: Base Overrides
    
    override func setupCellData(_ aCellData: SMListCellData) {
        
        super.setupCellData(aCellData)
        
    }
    
    override func setupWith(model aModel: AnyObject?) {
        
        super.setupWith(model: aModel)
        
    }
}
