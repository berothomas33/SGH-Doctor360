//
//  Frequncylist.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation


import UIKit
import ObjectMapper


class Frequncylist :  Mappable {

   
    var id: Int?
    
    var description: String?
    
    var englishName: String?
    
    var arabicName: String?
   
    var codeToOrder: String?
    var Value : Float = 0.00
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        
      id  <- map["id"]
        description   <- map["Description"]
       englishName    <- map["EnglishName"]
        arabicName   <- map["ArabicName"]
        codeToOrder   <- map["CodeToOrder"]
        Value <- map["Value"]
        
    }
    

}
