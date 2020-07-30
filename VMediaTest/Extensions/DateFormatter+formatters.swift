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
        result.timeZone = TimeZone(secondsFromGMT: 0)
        result.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return result
    }()
    
    static var onlyDayDF: DateFormatter = {
        
        let result: DateFormatter = DateFormatter()
        result.dateFormat = "yyyy-MM-dd"
        return result
    }()

}
