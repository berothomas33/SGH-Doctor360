//
//  RadioSelected.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/23/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation

import Foundation
import RealmSwift






class RadioSelected : Object {
    
    
    @objc dynamic var id = 0
    
    @objc dynamic var name: String = ""
    
    @objc dynamic var code: String = ""
    
    @objc dynamic var arabicName: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    
    
    convenience init?(id :Int , name:String, code : String,  arabicName : String ) {
        
        
        
        
        self.init()
        
        self.id = id
        self.name = name
        self.code = code
        self.arabicName = arabicName
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
