//
//  TeleMedicine.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/24/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
/*
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

class  TeleMedicineOBJEct : Mappable {
    var iD : Int?
    var date : String?
    var name : String?
    var time_from : String?
    var time_to : String?
    var clinic_id : Int?
    var url : String?

    
   
  
   
    
    
    
    
    
    
    
     init() {}
       required init?(map : Map){}

    func mapping(map: Map) {

        iD <- map["id"]
        date <- map["date"]
        name <- map["name"]
        clinic_id  <- map["clinic_id"]
        time_from <- map["time_from"]
        time_to <- map["time_to"]
        url <- map["url"]
    }

}
