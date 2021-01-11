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

 
    @objc dynamic var ItemCode :  String = ""
    @objc dynamic var Name : String = ""
    @objc dynamic var Strength_No = 0.0
    @objc dynamic var Strength_Unit : String = ""
   @objc dynamic var Maximum = 1
    @objc dynamic var Stock = 1
    
    
    
    
    
    
    override class func primaryKey() -> String? {
              return "ItemCode"
          }
   
    
    
   
    
    
    
    
    convenience init?(dictionary: [String:Any]?) {

        
        
        
        
        
        
        

        guard let dictionary = dictionary,
                   let name = dictionary["Name"] as? String,
                   let ItemCode = dictionary["ItemCode"] as? String,

                    let Strength_No = dictionary["Strength_No"] as? Double,
                   
                    let Strength_Unit = dictionary["Strength_Unit"] as? String,
                   
                    
                    let Stock = dictionary["Stock"] as? Int,
                    
                   let Maximum = dictionary["Maximum"] as? Int



                   else { return nil }

       
        self.init()
        
        self.ItemCode = ItemCode
        self.Name = name
        self.Strength_No = Strength_No
        self.Strength_Unit = Strength_Unit
        self.Maximum = Maximum
        self.Stock = Stock
        
        
        


    }

    
    
    
    
    

}
