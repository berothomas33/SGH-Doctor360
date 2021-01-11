//
//  DiagonSElectd.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/20/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation


import Foundation

import RealmSwift





class  DiagonSElectd : Object {


 @objc dynamic var ID : String  = UUID().uuidString
    @objc dynamic var CODE: String = ""
    
    @objc dynamic var Descriptio: String = ""
    
    override static func primaryKey() -> String? {
        return "ID"
    }
    
    convenience init(ID:Int,CODE:String,Descriptio :String) {
        self.init()
        
        self.ID = String(ID)
        self.CODE = CODE
        self.Descriptio = Descriptio
        
        
        
        
        
        
    }
    
    
    
}
