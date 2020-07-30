//
//  SMChannelCell.swift
//  VMediaTest
//
//  Created by OLEKSANDR SEMENIUK on 29.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.


import VRGSoftSwiftIOSKit

class SMChannelCellData: SMCollectionCellData {
    
    static let cellWidth = 100
    
    required init(model aModel: AnyObject?) {
        
        super.init(model: aModel)

        self.cellSize = CGSize(width: SMChannelCellData.cellWidth, height: SMChannelsViewController.cellHeight)
    }

    override class var cellNibName_: String? {
        
        let result: String = String(describing: SMChannelCell.self)
        
        return result
    }
}

class SMChannelCell: SMBaseCollectionCell {
 
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .blue
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.black.cgColor
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
