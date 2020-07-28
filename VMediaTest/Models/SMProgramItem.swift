//
//  SMProgramItem.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import Foundation

class SMProgramItem: Codable {
    
    let length: Int
    let name: String
    let startTime: Date
    
    let recentAirTime: SMRecentAirTime
}
