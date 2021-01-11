//
//  Extensiondata.swift
//  motamerat
//
//  Created by ebram thomas on 2/16/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
extension Date {
 var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
        //RESOLVED CRASH HERE
    }

    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
    
    
    
       
   
}
