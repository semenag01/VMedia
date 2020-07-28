//
//  SMUIConfigurator.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit

// swiftlint:disable force_unwrapping

final class SMUIConfigurator {
    
    public class navBarItem {
        
        class func back() -> UIBarButtonItem {

            let bgI: UIImage? = R.image.navBar_back()

            let button: UIButton = UIButton(type: .system)
            button.setImage(bgI, for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            button.contentHorizontalAlignment = .center

            return UIBarButtonItem(customView: button)
        }
//
//        class func close() -> UIBarButtonItem {
//
//            let bgI: UIImage? = R.image.navBar_close()
//
//            let button: UIButton = UIButton(type: .system)
//            button.setImage(bgI, for: .normal)
//            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//            button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
//            button.contentHorizontalAlignment = .center
//
//            return UIBarButtonItem(customView: button)
//        }
    }
    
    public class prepare {
                
    }
}
