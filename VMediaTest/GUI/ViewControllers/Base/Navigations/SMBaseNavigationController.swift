//
//  SMBaseNavigationController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit

class SMBaseNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        delegate = self
        interactivePopGestureRecognizer?.delegate = self
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if let orienation: UIInterfaceOrientationMask = topViewController?.supportedInterfaceOrientations {
            
            return orienation
        }
        
        if SMHelper.isIPad {
            
            return [UIInterfaceOrientationMask.portrait, UIInterfaceOrientationMask.landscape]
        } else {
            
            return [UIInterfaceOrientationMask.portrait]
        }
    }
    
    override var shouldAutorotate: Bool {
        
        let result: Bool = topViewController?.shouldAutorotate ?? true
        
        return result
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return topViewController?.preferredStatusBarStyle ?? UIStatusBarStyle.default
    }
    
    
    // MARK: UINavigationControllerDelegate
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return transition(from: fromVC, to: toVC)
    }
    
    func transition(from: UIViewController, to: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return nil
    }
}
