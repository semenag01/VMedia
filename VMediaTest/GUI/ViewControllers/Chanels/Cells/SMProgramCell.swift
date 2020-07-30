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
            
            let widthPICell: Int = pi.length * SMChannelsViewController.minutesInPixel
            print("widthPICell_\(widthPICell)")
            
            self.cellSize = CGSize(width: pi.length * SMChannelsViewController.minutesInPixel, height: SMChannelsViewController.cellHeight)
        }
    }
    
    override class var cellNibName_: String? {
        
        let result: String = String(describing: SMProgramCell.self)
        
        return result
    }
}

class SMProgramCell: SMBaseCollectionCell {
 
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .green
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.darkGray.cgColor
        
        self.lbTitle.adjustsFontSizeToFitWidth = true
        self.lbTime.adjustsFontSizeToFitWidth = true
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
        
        if let pi: SMProgramItem = aModel as? SMProgramItem {
            
            lbTitle.text = pi.name
            lbTime.text = DateFormatter.uiTimeDF.string(from: pi.startTime) + "\nlength = \(pi.length)"
        }
    }
}
