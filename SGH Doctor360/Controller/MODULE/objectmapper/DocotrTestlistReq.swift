//
//  DocotrTestlistReq.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation



import UIKit
import ObjectMapper


class DocotrTestlistReq : Mappable {


    
    var patientName: String?
    
    var registrationNo: Int?
    
    var testID: Int?
    
    var code: String?
    
    var testName: String?
    
    var testNameArabic: String?
    
    var testDateTime: String?
    
    var remarks: String?
    
    var pdFlink: String?
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        
        
        
        
        
     patientName  <- map["PatientName"]
     registrationNo  <- map["RegistrationNo"]
      testID <- map["TestID"]
      code <- map["Code"]
     testName  <- map["TestName"]
      testNameArabic <- map["TestNameArabic"]
      testDateTime <- map["TestDateTime"]
      remarks <- map["Remarks"]
     pdFlink  <- map["PDFlink"]
        
        
        
        
        
    }

}
