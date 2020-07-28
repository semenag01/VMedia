//
//  JSONDecoder+decoders.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 28.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import Foundation


extension JSONDecoder {
    
    static var commonDecoder: JSONDecoder = {
        
        let result: JSONDecoder = JSONDecoder()
        result.dateDecodingStrategy = .formatted(DateFormatter.decodeDF)
        return result
    }()
}
