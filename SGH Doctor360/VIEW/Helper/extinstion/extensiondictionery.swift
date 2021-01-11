//
//  extensiondictionery.swift
//  SanyeBatey
//
//  Created by ebram thomas on 11/11/19.
//  Copyright © 2019 ebram thomas. All rights reserved.
//

import Foundation
extension Dictionary {
    mutating func update(other:Dictionary) {
        for (key,value) in other {
            self.updateValue(value, forKey:key)
        }
    }
}
