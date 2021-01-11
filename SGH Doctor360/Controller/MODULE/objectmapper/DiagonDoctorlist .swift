//
//  DiagonDoctorlist .swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation

import UIKit
import ObjectMapper



class DiagonDoctorlist : Mappable {
    
    
    var id: Int?
    
    var code: String?
    
    var description: String?
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
       id <- map["ID"]
       code <- map["CODE"]
        
        
        description <- map["DESCRIPTION"]
        
        
    }
    
    
}
