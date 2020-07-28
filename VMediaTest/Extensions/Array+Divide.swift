//
//  Array+Divide.swift
//  wellness
//
//  Created by OLEKSANDR SEMENIUK on 1/11/19.
//  Copyright © 2019 OLEKSANDR SEMENIUK. All rights reserved.
//

extension Array
{
    func divide(comparator: (Element, Element) -> Bool) -> [[Element]]
    {
        var result: [[Element]] = []
        
        var section: [Element] = []
        
        forEach {
            if let obj1: Element = section.last
            {
                if comparator(obj1, $0)
                {
                    section.append($0)
                } else
                {
                    result.append(section)
                    section = [$0]
                }
            } else
            {
                section.append($0)
            }
        }
        
        result.append(section)
        
        return result
    }
}

extension Array where Element: Equatable {
    
    func removeDuplicates() -> [Element] {
        
        var result: [Element] = [Element]()

        for value in self {
            
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}
