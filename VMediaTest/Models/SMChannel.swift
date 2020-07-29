//
//  SMChannel.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import Foundation

class SMChannel: Codable {

    let id: Int
    let orderNum: Int
    let accessNum: Int
    let CallSign: String
    
    var programItems: [SMProgramItem]?
    
    var avalibleDays: [Date]? {
        
        return programItems?.map { $0.startTime.onlyDay() }
    }
    
    func programItemsFor(day: Date) -> [SMProgramItem]? {
        
        return programItems?.filter { $0.startTime.sm.isEqualToDateIgnoringTime(day) }
    }
    
    func intervalFor(day: Date) -> (Int, Int) {

        var result: (Int, Int) = (0, 0)
        
        if let programItems: [SMProgramItem] = self.programItemsFor(day: day),
            let programStart: SMProgramItem = programItems.first,
            let programFinish: SMProgramItem = programItems.last {
            
            result.0 = programStart.startTime.sm.hour * 60 + programStart.startTime.sm.minute
            result.1 = programFinish.startTime.sm.hour * 60 + programFinish.startTime.sm.minute + programFinish.length
        }
        
        return result
    }
}
