//
//  HospitaLlists.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/14/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation


import UIKit
import ObjectMapper
class HospitaLlists : Mappable {
    
    var id: Int?
    
    var hospitalName: String?
    
    var connectionString: Any?
    
    var testPdfLink: Any?
    
    var radiologyPdfLink: Any?
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        
        
        
        
        id  <- map["ID"]
        
        hospitalName  <- map["HospitalName"]
        
        connectionString  <- map["ConnectionString"]
        
        testPdfLink  <- map["TestPdfLink"]
        
        radiologyPdfLink  <- map["RadiologyPdfLink"]
        
   
        
        
    }
    
    
    
    
    func save()  {
           Cache.set(object: self.toJSON(), forKey: "CurrentHospital")
       }
       func remove()  {
           Cache.removeObject(key: "CurrentHospital")
           
       }
       
       
       // return object from cashe(user defaulat)
       class func currenHospital() -> HospitaLlists? {
           if let json = Cache.object(key: "CurrentHospital") as? [String:Any] {
               
               return Mapper<HospitaLlists>().map(JSON: json)
           }
           return nil
       }
    
}
