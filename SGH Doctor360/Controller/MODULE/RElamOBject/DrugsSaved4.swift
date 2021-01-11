//
//  DrugsSaved4.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/6/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
import Foundation


import RealmSwift
@objcMembers class DrugsSaved4 : Object {

 

    @objc dynamic var ID : String  = ""
    @objc dynamic var ItemCode :  String = ""
    @objc dynamic var Name : String = ""
    @objc dynamic var Strength_No = 0.0
    @objc dynamic var Strength_Unit : String = ""
    
    
    override class func primaryKey() -> String? {
              return "ID"
          }
   
    
    
     convenience init(ID:Int,ItemCode:String,Name:String,Strength_No:Double,Strength_Unit:String) {
         self.init()
        
       self.ID = String(ID)
               self.ItemCode = ItemCode
               self.Name = Name
               self.Strength_No = Strength_No
               self.Strength_Unit = Strength_Unit
        
    }
    
    
    
    

}
