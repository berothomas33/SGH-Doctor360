//
//  TestlistR.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/7/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class TestlistR : Mappable {
    
    
    
    var ID: Int?
    
    var code: String?
    
    var Name: String?
    
    var testNameArabic: String?
    
    
    
    
    
    
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        ID <- map["ID"]
        
        code <- map["Code"]
        
        Name <- map["Name"]
        
        testNameArabic <- map["ArabicName"]
        
        
        
        
        
    }
    
}

