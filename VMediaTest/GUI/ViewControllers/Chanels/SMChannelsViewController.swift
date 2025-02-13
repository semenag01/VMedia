//
//  SMChannelsViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//


import VRGSoftSwiftIOSKit

final class SMChannelsViewController: SMBaseCollectionViewController {

    @IBOutlet weak var parentScrollView: UIScrollView!
    
    @IBOutlet weak var btPrevious: UIButton!
    @IBOutlet weak var btNext: UIButton!
    
    static let minutesInPixel: Int = 7
    static let cellHeight: Int = 40

    override func createPresenter() -> SMBasePresenter {
        
        let result: SMChannelsPresenter = SMChannelsPresenter(vc: self)
        
        return result
    }
    
    var custPresenter: SMChannelsPresenter? {
        
        return presenter as? SMChannelsPresenter
    }
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        updatePageButtons()
        prepareLocalization()
    }
    
    
    // MARK: Base Overrides
    
    override func parentListView() -> UIView {
        
        return parentScrollView
    }
    
    override func configureListView() {
        
        super.configureListView()
        
        listView?.delaysContentTouches = true
        listView?.showsVerticalScrollIndicator = true
    }
    
    override func configureListDisposer() {
        
        super.configureListDisposer()

        collectionView?.register(UINib(nibName: SMChannelCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMChannelCellData.self))

        collectionView?.register(UINib(nibName: SMTimeCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMTimeCellData.self))

        collectionView?.register(UINib(nibName: SMProgramCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMProgramCellData.self))

        collectionView?.register(UINib(nibName: SMEmptyCellData.cellNibName_!, bundle: nil), forCellWithReuseIdentifier: String(describing: SMEmptyCellData.self))
    }

    
    // MARK: Logic
    
    func updatePageButtons() {

        let index: Int = custPresenter?.currentIndex ?? 0
        let count: Int = custPresenter?.dateCount ?? 0

        btPrevious.isEnabled = index > 0
        btNext.isEnabled = index < count - 1
    }
    
    
    // MARK: Actions
    
    @IBAction func btPreviousAction(_ sender: Any) {
        
        custPresenter?.currentIndex -= 1
    }
    
    @IBAction func btNextActions(_ sender: Any) {
        
        custPresenter?.currentIndex += 1
    }
}


// MARK: SMChannelsPresenterProtocol

extension SMChannelsViewController: SMChannelsPresenterProtocol {
    
    func open(_ chanel: SMChannel) {
        
        print("open chanel ", chanel)
    }
    
    func open(_ program: SMProgramItem) {
        print("open program ", program)
    }
    
    func willReloadWithInterval(_ interval: Int) {
        
        let width: CGFloat = CGFloat(interval * SMChannelsViewController.minutesInPixel + SMChannelCellData.cellWidth)
        listView?.sm.width = width
                
        parentScrollView.contentSize = CGSize(width: width, height: self.listView?.sm.height ?? 0)
        
        updatePageButtons()
    }
}
