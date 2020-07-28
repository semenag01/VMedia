//
//  SMBaseListViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit

protocol SMBaseListViewProtocol {
    
    func setupSections(_ aSections: [SMListSection])
    func reloadDisposer()
}


class SMBaseListViewController: SMBaseViewController, SMBaseListViewProtocol {
    
    weak var externalScrollViewDelegate: UIScrollViewDelegate?
    
    var emptyView: UIView?

    var listView: UIScrollView?
    var listDisposer: SMListDisposer?
    
    var additionalBottomInset: CGFloat {
        return 8
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        listView = createListView()
        configureListView()
        
        listDisposer = createListDisposer()
        configureListDisposer()
    }
    
    func createListView() -> UIScrollView {
        
        return UIScrollView()
    }
    
    func createListDisposer() -> SMListDisposer? {
        
        return nil
    }

    func configureListView() {
        
        if let listView: UIScrollView = listView {
            
            listView.frame = self.frameListView()
            listView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            listView.backgroundColor = UIColor.clear
            listView.clipsToBounds = true
            listView.alwaysBounceVertical = true
            self.parentListView().addSubview(listView)
        }
    }
    
    func configureListDisposer() {
        
        listDisposer?.listView = listView
    }
    
    func parentListView() -> UIView {
        
        return self.view
    }
    
    func frameListView() -> CGRect {
        
        return self.parentListView().bounds
    }

    
    // MARK: SMBaseListViewProtocol
    
    func setupSections(_ aSections: [SMListSection]) {
        
        listDisposer?.sections.removeAll()
        listDisposer?.sections = aSections
        listDisposer?.reloadData()
    }
    
    func reloadDisposer() {
        
        listDisposer?.reloadData()
    }
}
