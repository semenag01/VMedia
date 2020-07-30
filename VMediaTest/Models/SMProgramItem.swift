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
    
    func startMinutes() -> Int {

        let today: Date = self.startTime.sm.dateAtStartOfDay
        let result: Int = today.sm.minutesTo(self.startTime) ?? 0
                
        return result
    }

    func finishMinutes() -> Int {
        
        let result: Int = startMinutes() + self.length
        
        return result
    }

    
    func breakMinutesWithNext(_ aProgramItem: SMProgramItem?) -> Int {
        
        var result: Int = 0
        
        if let programItem: SMProgramItem = aProgramItem {
            
            result = programItem.startMinutes() - self.finishMinutes()
        }
        print(result)
        return result
    }
    
    func breakMinutesWithBefore(_ aProgramItem: SMProgramItem?) -> Int {
        
        var result: Int = self.startMinutes()
        
        if let programItem: SMProgramItem = aProgramItem {
            
            result = programItem.startMinutes() - self.finishMinutes()
        }
        print(result)
        return result
    }
}
