//
//  Set+help.swift
//  VMediaTest
//
//  Created by SEMENIUK OLEKSANDR on 29.07.2020.
//  Copyright © 2020 SEMENIUK OLEKSANDR. All rights reserved.
//

import Foundation

extension Set {
    
    @discardableResult mutating func insert(_ newMembers: [Set.Element]) -> [(inserted: Bool, memberAfterInsert: Set.Element)] {
        
        var returnArray: [(inserted: Bool, memberAfterInsert: Set.Element)] = []
        
        newMembers.forEach { (member) in
            returnArray.append(self.insert(member))
        }
        return returnArray
    }
}
