//
//  SMBaseCollectionViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit

class SMBaseCollectionViewController: SMBaseListViewController, SMCollectionDisposerDelegate {
    
    var collectionView: UICollectionView? { return listView as? UICollectionView }

    var collectionDisposer: SMCollectionDisposer? { return listDisposer as? SMCollectionDisposer }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func createListView() -> UICollectionView {
        
        let collectionViewLayout: UICollectionViewLayout = createCollectionViewLayout()
        configureCollectionViewLayout(collectionViewLayout)
        
        let result: UICollectionView = collectionViewClass().init(frame: self.frameListView(), collectionViewLayout: collectionViewLayout)
        
        return result
    }
    
    func collectionViewClass() -> UICollectionView.Type {
        
        return UICollectionView.self
    }
    
    override func createListDisposer() -> SMListDisposer {
        
        let result: SMCollectionDisposer = SMCollectionDisposer()
                
        return result
    }
    
    override func configureListDisposer() {
        
        super.configureListDisposer()
        
        collectionDisposer?.delegate = self
    }
    

    func createCollectionViewLayout() -> UICollectionViewLayout {
        
        let result: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        result.minimumLineSpacing = 0
        result.minimumInteritemSpacing = 0
        return result
    }
    
    func configureCollectionViewLayout(_ aFlowLayout: UICollectionViewLayout) {
        
    }
    
    override func configureListView() {
        
        super.configureListView()        
    }
}
