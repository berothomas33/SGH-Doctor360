//
//  AdmissionPLaces.swift
//  SGH Doctor360
//
//  Created by mac on 11/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
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


class AdmissionPLaces: Mappable {
    var ID  = 0
    var Name = ""
   
    
    init() {}
    required init?(map: Map) {
        
    }
    
    
    
    
    func mapping(map: Map) {
        ID <- map["ID"]
        Name <- map["Name"]
        
    }
    
    
}
