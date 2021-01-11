//
//  extensindata.swift
//  MAKAWEL
//
//  Created by ebram thomas on 4/16/19.
//  Copyright © 2019 inJaz. All rights reserved.
//

import Foundation

extension Data
{
    func toString() -> String?
    {
        return String(data: self, encoding: .utf8)
    }
}

