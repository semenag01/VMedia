//
//  SMAppFlowController.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import VRGSoftSwiftIOSKit
import UIKit

final class SMAppFlowController: UIViewController {
    
	// MARK: - Services
    
	// MARK: - Child view controllers

	private var channelsVC: SMChannelsViewController = SMChannelsViewController()

    
	// MARK: - Life cycle

	override func viewDidLoad() {
        
		super.viewDidLoad()

		initialSetup()
	}
}


// MARK: - Private

fileprivate extension SMAppFlowController {

	func initialSetup() {
        
        addChild(channelsVC, toContainer: self.view)
	}
}
