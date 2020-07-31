//
//  SMTimeCell.swift
//  VMediaTest
//
//  Created by OLEKSANDR SEMENIUK on 29.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.


import VRGSoftSwiftIOSKit

class SMTimeCellData: SMCollectionCellData {
    
    static let deltaTimeMinutes: Int = 30
    
    var isTime: Bool = true {
        didSet {
            if isTime {
                self.cellSize = CGSize(width: SMTimeCellData.deltaTimeMinutes * SMChannelsViewController.minutesInPixel, height: SMChannelsViewController.cellHeight)
            } else {
                self.cellSize = CGSize(width: SMChannelCellData.cellWidth, height: SMChannelsViewController.cellHeight)
            }
        }
    }
    
    var date: Date?
    
    override class var cellNibName_: String? {
        
        let result: String = String(describing: SMTimeCell.self)
        
        return result
    }
}

class SMTimeCell: SMBaseCollectionCell {
 
    @IBOutlet weak var lbTitle: UILabel!
    
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
        
        if let cd: SMTimeCellData = aCellData as? SMTimeCellData, let date: Date = cd.date {
            
            if cd.isTime {
                
                lbTitle.text = DateFormatter.uiTimeDF.string(from: date)
            } else {
                    
                lbTitle.text = DateFormatter.uiOnlyDateDF.string(from: date)
            }
        }
    }
    
    override func setupWith(model aModel: AnyObject?) {
        
        super.setupWith(model: aModel)
        
    }
}
