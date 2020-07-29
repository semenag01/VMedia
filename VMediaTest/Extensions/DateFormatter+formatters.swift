//
//  DateFormatter+formatters.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static var decodeDF: DateFormatter = {
        
        let result: DateFormatter = DateFormatter()        
        result.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return result
    }()
    
    static var onlyDayDF: DateFormatter = {
        
        let result: DateFormatter = DateFormatter()
        result.dateFormat = "yyyy-MM-dd"
        return result
    }()

}

extension Date {
    
    init(_ year: Int, _ month: Int, _ day: Int) {
        
        self = DateFormatter.onlyDayDF.date(from: "\(year)-\(month)-\(day)")!
    }
    
    func onlyDay() -> Date {
        
        return Date(self.sm.year, self.sm.month, self.sm.day)
    }
}
