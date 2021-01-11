//
//  RouteAdminLIst.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/7/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation




//
//  Duarationlistobj.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/4/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation


import Foundation
import ObjectMapper
import UIKit





class RouteAdminLIst : Mappable {
    
    
    
    var id: Int?
    
    var description: String?
    
    var pValue: String?
    
    var arabicName: String?
    
   
    
    
    
    
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        
        
        
        id  <- map["Id"]
        description  <- map["Description"]
        pValue   <- map["pValue"]
        arabicName <- map["ArabicName"]
        
    }
    
    
}

