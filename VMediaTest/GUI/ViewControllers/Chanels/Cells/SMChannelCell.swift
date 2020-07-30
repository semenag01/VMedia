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
 
    @IBOutlet weak var lbTitle: SMLabel!
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        clean()
    }
    
    override func prepareForReuse() {
        
        super.prepareForReuse()
        
        clean()
    }
    
    func clean() {
        
        lbTitle.text = nil
    }
    
    
    // MARK: Base Overrides
    
    override func setupCellData(_ aCellData: SMListCellData) {
        
        super.setupCellData(aCellData)
        
    }
    
    override func setupWith(model aModel: AnyObject?) {
        
        super.setupWith(model: aModel)
        
        if let channel: SMChannel = aModel as? SMChannel {
            
            lbTitle.text = channel.CallSign
        }
    }
}
