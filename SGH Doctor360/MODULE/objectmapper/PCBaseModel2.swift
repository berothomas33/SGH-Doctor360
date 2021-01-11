//
//  PCBaseModel2.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/24/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper


class PCBaseModel2: Mappable {
    var code = 0
    var message = ""
    var eData : [TeleMedicineOBJEct]?
   
    
    init() {}
    required init?(map: Map) {
        
    }
    
    
    
    
    func mapping(map: Map) {
        code <- map["eCode"]
        message <- map["eMessage"]
        eData <- map["eData"]
        
    }
    
    
}
