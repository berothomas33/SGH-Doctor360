//
//  RadiologySaved.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/7/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
////
//  labTestDoctorlist.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/4/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation


import ObjectMapper
import RealmSwift
import Realm

@objcMembers  class RadiologySaved :  Object {
    
    
  dynamic var id = 0

 @objc dynamic var name: String = ""

 @objc dynamic var code: String = ""

 @objc dynamic var arabicName: String = ""


     
     override class func primaryKey() -> String? {
               return "id"
           }
     
     
     
 convenience init?(dictionary: [String:Any]?) {


     guard let dictionary = dictionary,
                let  id  = dictionary["ID"] as? Int ,
                let name = dictionary["Name"] as? String,
                let code = dictionary["Code"] as? String,

                let arabicName = dictionary["ArabicName"] as? String



                else { return nil }

            self.init()

            self.id = id
            self.name = name
            self.code = code
            self.arabicName = arabicName



 }


 }





