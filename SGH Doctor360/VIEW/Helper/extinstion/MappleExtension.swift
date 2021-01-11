//
//  MappleExtension.swift
//  SGH Doctor360
//
//  Created by mac on 12/16/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
import ObjectMapper


extension Mappable {
    var descriptionY: String {
        return toJSONString(prettyPrint: true) ?? "\(self)"
    }
}
