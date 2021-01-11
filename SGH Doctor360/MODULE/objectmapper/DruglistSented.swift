//
//  Druglist.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation

import UIKit
import ObjectMapper



class DruglistSented : Mappable {
    
    var id: Int?
    
    
    var DrugId: Int?
    
    
    
    var Remarks: String?
    
    
    
    var itemCode: String?
    
    var name: String?
    
    
    
    var StrengthNo: Double?
    
    
    var strengthNo: Double?
    
    
    
    
    
    var strengthUnit: String?
    
    
    var duration: String?
    
    var beforeAfter: String?
    
    
    var frequancy: String?
    
    
    
    var duration_No: String?
    
    
    var routeOfAdmin: String?
    
    
    var frequencyID: String?
    
    
    // Strength
    //RouteOfAdmin
    //
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        
        
        
        
        strengthUnit <- map["Strength_Unit"]
        
        duration  <- map["Duration"]
        beforeAfter    <- map["BeforeAfter"]
        
        frequancy  <- map["Frequancy"]
        
        
        duration_No  <- map["Duration_No"]
        
        routeOfAdmin <- map["RouteOfAdmin"]
        
        frequencyID <- map["FrequencyID"]
        
        
        
        
    }
    
}
