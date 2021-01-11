//
//  FreqSaved2.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/6/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation

import RealmSwift

@objcMembers class FreqSaved2 :Object {

    
    dynamic var id = 0
    
    @objc dynamic var descriptio: String = ""
    
    @objc dynamic var englishName: String = ""
    
    @objc dynamic var arabicName: String = ""
    
    @objc dynamic var codeToOrder : String = ""
    
    
    @objc dynamic var  Value : Float = 1.00
    
    override class func primaryKey() -> String? {
           return "id"
       }
    
    
    
    
    
    convenience init?( id :Int , descriptio:String, englishName : String , arabicName : String,  codeToOrder : String ,  Value :  Float ) {
        
        
        
       
        
        


               self.init()

               self.id = id
               self.descriptio = descriptio
               self.englishName = englishName
        
      
        self.Value = Value
             
            
               self.arabicName = arabicName
        
               self.codeToOrder = codeToOrder
        
        
        
        
        
       
    }
    
    
}
