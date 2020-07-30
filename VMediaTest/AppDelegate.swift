//
//  AppDelegate.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import UIKit
import VRGSoftSwiftIOSKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {

		SMDBStorageConfigurator.registerStorageClass(SMMainStorage.self)

		configureGateways()

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = SMAppFlowController()
		window?.makeKeyAndVisible()

		return true
    }
    
	private func configureGateways() {

		SMGatewayConfigurator.shared.url = URL(string: SMAPPConfig.baseUrlWithApiVersion)
	}    
}
