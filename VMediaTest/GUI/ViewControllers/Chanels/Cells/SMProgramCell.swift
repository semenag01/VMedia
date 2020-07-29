//
//  SMProgramCell.swift
//  VMediaTest
//
//  Created by OLEKSANDR SEMENIUK on 29.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.


import VRGSoftSwiftIOSKit

class SMProgramCellData: SMCollectionCellData {
    
    required init(model aModel: AnyObject?) {
        
        super.init(model: aModel)
        
        if let pi: SMProgramItem = aModel as? SMProgramItem {
            
            self.cellSize = CGSize(width: pi.length * kSMOneMinutesInPixel, height: 40)
        }
    }
    
    override class var cellNibName_: String? {
        
        let result: String = String(describing: SMProgramCell.self)
        
        return result
    }
}

class SMProgramCell: SMBaseCollectionCell {
 
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .green
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
