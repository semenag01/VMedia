//
//  SMMainStorage.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import VRGSoftSwiftIOSKit

class SMMainStorage: SMDBStorage {
    
    override func persistentStoreName() -> String? {
        return "DataModel"
    }
}
