//
//  DuarationSaved.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/5/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
////
//  Duarationlistobj.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/4/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

//import Foundation
//
//
//import Foundation
//import ObjectMapper
//import UIKit

import Foundation

import RealmSwift



class DuarationSaved : Object {
    
   
    
    @objc dynamic var id = 0
    
    @objc dynamic var descriptio: String = ""
    
    @objc dynamic var pValue: String = ""
    
    @objc dynamic var arabicName: String = ""
    
    @objc dynamic var conversionValue = 0
    
    
    
    override class func primaryKey() -> String? {
              return "id"
          }
    
    
    convenience init?(dictionary: [String:Any]?) {
        
         
        guard let dictionary = dictionary,
                   let  id  = dictionary["Id"] as? Int ,
                   let descriptio = dictionary["Description"] as? String,
                   let pValue = dictionary["pValue"] as? String,
                   
                   let arabicName = dictionary["ArabicName"] as? String,
               let conversionValue = dictionary["ConversionValue"] as? Int

               
                   else { return nil }

              
self.init()
               self.id = id
               self.descriptio = descriptio
               self.pValue = pValue
               self.arabicName = arabicName
               self.conversionValue = conversionValue
        
        
        
        
        
       
    }
    
    
}

