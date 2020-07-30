//
//  SMEmptyCell.swift
//  VMediaTest
//
//  Created by OLEKSANDR SEMENIUK on 30.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.


import VRGSoftSwiftIOSKit


class SMEmptyCellData: SMCollectionCellData {

    var breakMinutes: Int = 0
    
    required init(breakMinutes aBreakMinutes: Int) {
        
        super.init(model: nil)
        
        breakMinutes = aBreakMinutes
        
        self.cellSize = CGSize(width: aBreakMinutes * SMChannelsViewController.minutesInPixel, height: SMChannelsViewController.cellHeight)
    }
    
    required init(model aModel: AnyObject?) {
        fatalError("init(model:) has not been implemented")
    }
    
    override class var cellNibName_: String? {
        
        let result: String = String(describing: SMEmptyCell.self)
        
        return result
    }
}

class SMEmptyCell: SMBaseCollectionCell {
 
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
    
        if let cd: SMEmptyCellData = aCellData as? SMEmptyCellData {
            
            lbTitle.text = "\(cd.breakMinutes)"
        }
    }
    
    override func setupWith(model aModel: AnyObject?) {
        
        super.setupWith(model: aModel)
    }
}
