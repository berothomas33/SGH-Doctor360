//
//  ProcedureSaveed.swift
//  SGH Doctor360
//
//  Created by ebram thomas on 9/6/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
//
//  ProcdeureSaveed.swift
//  SGH Doctor360
//
//  Created by ebram thomas on 9/3/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
import Foundation
import Foundation

import RealmSwift

class ProcdeureSaveed : Object {
    
    @objc dynamic var ProcdeuureID : Int  = 0
    @objc dynamic var Qty: Int = 0
    
    @objc dynamic var Remarks: String = ""
     @objc dynamic var Name: String = ""
    
    override static func primaryKey() -> String? {
        return "ProcdeuureID"
    }
    
    convenience init(ProcdeuureID:Int,Qty:Int,Remarks :String, Name : String) {
        self.init()
        
        self.ProcdeuureID = ProcdeuureID
        self.Qty = Qty
        self.Remarks = Remarks
        self.Name = Name
        
        
        
        
        
        
    }
    
    
    
}
