//
//  RouteAdminSaved2.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/7/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation

import RealmSwift


@objcMembers class RouteAdminSaved2 :  Object {

 dynamic var id = 0

@objc dynamic var descriptio: String = ""

@objc dynamic var pValue: String = ""

@objc dynamic var arabicName: String = ""




    override class func primaryKey() -> String? {
              return "id"
          }


convenience init?(id :Int , descriptio:String, arabicName : String,  pValue : String ) {
    
    
    

           self.init()

           self.id = id
           self.descriptio = descriptio
           self.pValue = pValue
           self.arabicName = arabicName
    
    
   
}


}

 
