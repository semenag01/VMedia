//
//  SMBaseViewController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit

public protocol SMBaseViewControllerMakerProtocol { }

extension SMBaseViewControllerMakerProtocol where Self: SMBaseViewController {
    
    static func make(representObject aRepresentObject: Any?) -> Self {
        
        let vc: Self = self.init()
        
        vc.representObject = aRepresentObject
        
        return vc
    }
}

extension SMBaseViewController: SMBaseViewControllerMakerProtocol { }


class SMBaseViewController: SMViewController {
    
    deinit {
        print(#function + " - \(type(of: self))")
    }

    let classNavigationController: SMBaseNavigationController.Type = SMBaseNavigationController.self
    
    var presenter: SMBasePresenter?

    // MARK: Represent
    
    var representObject: Any?
    
    func updateRepresentation() {
        
        updateRepresentation(representObject: representObject)
    }
    
    func updateRepresentation(representObject aRepresentObject: Any?) {
        
        presenter?.representObject = aRepresentObject
    }
    

    // MARK: For override
    
    func createPresenter() -> SMBasePresenter? {
        
        return nil
    }
    
    override func createLeftNavButton() -> UIBarButtonItem? {
        
        if self.isModal {
            
			return nil
        } else {
            
            return SMUIConfigurator.navBarItem.back()
        }
    }

    override func didBtNavRightClicked() {

        close()
    }
    
    open func performCallBackWith(sender aSender: Any?, goBack isGoBack: Bool, delay aDelay: Double? = 0) {
        
        if isGoBack {
            
            self.close()
        }

        if let delay: Double = aDelay, delay > 0 {
            
            self.callBack?(self, aSender)
        } else {
         
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                
                self.callBack?(self, aSender)
            }
        }
    }
    
    func leftNavButtonColor() -> UIColor? {

        if #available(iOS 13.0, *) {
            return .label
        } else {
			return UIColor.black
        }
    }

    func navBarColor() -> UIColor? {
        return nil
    }
    
    func navBarShadowImage() -> UIImage? {
        return navBarImage()
    }
    
    func navBarImage() -> UIImage? {
        return nil
    }
    
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        presenter = createPresenter()
        presenter?.representObject = representObject
        
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if isFirstAppear {

            presenter?.firstViewWillAppear(animated)
        }
        
        presenter?.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        presenter?.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        view.endEditing(true)
        
        presenter?.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        presenter?.viewDidDisappear(animated)
    }

    override func close() {
        
        super.close()
        
        presenter?.close()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
        if SMHelper.isIPad {
            return [UIInterfaceOrientationMask.portrait, UIInterfaceOrientationMask.landscape]
        } else {
            
            return [UIInterfaceOrientationMask.portrait]
        }
    }
    
    var canShowPlayerView: Bool {
        return false
    }
    

    // MARK: Alert
    
    func showAlertWith(error aError: Error?) {
        
        if let error: Error = aError {
            sm.showAlertController(title: "", message: error.localizedDescription, cancelButtonTitle: R.string.localizable.ok())
        }
    }

    func showAlertWith(response aResponse: SMResponse?) {
        
        let titleMessage: String = aResponse?.titleMessage ?? ""
        
        if let textMessage: String = aResponse?.textMessage, let response: SMResponse = aResponse {
            
            if !textMessage.isEmpty && !response.isCancelled {
                
                sm.showAlertController(title: titleMessage, message: textMessage, cancelButtonTitle: R.string.localizable.ok())
            }
        }
    }
    
    func showAlertWith(validator aValidator: SMValidator?) {
        
        if let validator: SMValidator = aValidator {
            
            sm.showAlertController(title: validator.titleMessage, message: validator.errorMessage, cancelButtonTitle: R.string.localizable.ok())
        }
    }

    func showAlertWith(title aTitle: String?, message aMessage: String?) {
        
        if aTitle != nil || aMessage != nil {
            
            sm.showAlertController(title: aTitle, message: aMessage, cancelButtonTitle: R.string.localizable.ok())
        }
    }
    
    func showAlertWith(title aTitle: String?, message aMessage: String?, handler aHandler: ((SMAlertController, Int) -> Void)?) {
        
        if aTitle != nil || aMessage != nil {
            
            sm.showAlertController(title: aTitle, message: aMessage, cancelButtonTitle: R.string.localizable.ok(), otherButtonTitles: nil, handler: aHandler)
        }
    }
    
    
    // MARK: Navigation
    
    func pushViewController(_ viewController: SMBaseViewController, animated: Bool = true) {
        
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func presentDefault(_ viewController: SMBaseViewController, withAnimation: Bool = true, modalPresentationStyle: UIModalPresentationStyle? = nil, modalTransitionStyle: UIModalTransitionStyle? = nil) {
        
        let classNc: UINavigationController.Type = viewController.classNavigationController as UINavigationController.Type
        let nc: UINavigationController = classNc.init(rootViewController: viewController)
        if let modalPresentationStyle: UIModalPresentationStyle = modalPresentationStyle {
            nc.modalPresentationStyle = modalPresentationStyle
        }
        
        if let modalTransitionStyle: UIModalTransitionStyle = modalTransitionStyle {
            nc.modalTransitionStyle = modalTransitionStyle
        }
        
        self.present(nc, animated: withAnimation, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }

    override var shouldAutorotate: Bool { return true }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        
        if SMHelper.isIPad {
            return UIInterfaceOrientation.landscapeLeft
        } else {
            return UIInterfaceOrientation.portrait
        }
    }
    
    
    // MARK: Localiztion
    
    func prepareLocalization() {
        
    }
}
