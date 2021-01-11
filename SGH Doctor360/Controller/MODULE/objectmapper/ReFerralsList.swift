//
//  ReFerralsList.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/21/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//




/*
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
import ObjectMapper

class ReFerralsList : Mappable {
    var registrationno : Int?
    var patientName : String?
    var gendar : String?
    var age : String?
    var nationality : String?
    var referral : String?
    var admitDateTime : String?
    var dischargeDateTime : String?

    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){

        registrationno <- map["Registrationno"]
        patientName <- map["PatientName"]
        gendar <- map["Gendar"]
        age <- map["Age"]
        nationality <- map["Nationality"]
        referral <- map["Referral"]
        admitDateTime <- map["AdmitDateTime"]
        dischargeDateTime <- map["DischargeDateTime"]
    }

}




