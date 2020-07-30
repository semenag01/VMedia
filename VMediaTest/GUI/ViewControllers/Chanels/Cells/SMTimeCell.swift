//
//  SMTimeCell.swift
//  VMediaTest
//
//  Created by OLEKSANDR SEMENIUK on 29.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.


import VRGSoftSwiftIOSKit

class SMTimeCellData: SMCollectionCellData {
    
    var text: String?
    
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
        
        if let cd: SMTimeCellData = aCellData as? SMTimeCellData {
            
            lbTitle.text = cd.text
        }
    }
    
    override func setupWith(model aModel: AnyObject?) {
        
        super.setupWith(model: aModel)
        
    }
}
