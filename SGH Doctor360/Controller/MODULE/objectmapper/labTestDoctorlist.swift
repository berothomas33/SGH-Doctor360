//
//  labTestDoctorlist.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/4/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation


import ObjectMapper


class labTestDoctorlist : Mappable {

    
    var id: Int?
   
    var code: String?
   
    var name: String?

  
//    var remarks: String?


   
    var arabicName: String?


    //
    
    init() {}
       required init?(map : Map){}
       
       
       
       func mapping(map : Map){
        
        
        id <- map["ID"]
         code   <- map["Code"]
         name   <- map["Name"]

//         remarks   <- map["Remarks"]


          arabicName  <- map["ArabicName"]
   

}

}
