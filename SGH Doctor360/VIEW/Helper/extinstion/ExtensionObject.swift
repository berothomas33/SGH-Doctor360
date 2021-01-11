//
//  ExtensionObject.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/9/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
import RealmSwift
extension Object {
func toDictionary() -> NSDictionary {
    let properties = self.objectSchema.properties.map { $0.name }
    let dictionary = self.dictionaryWithValues(forKeys: properties)

    var mutabledic = NSMutableDictionary()
    mutabledic.setValuesForKeys(dictionary)

    for prop in (self.objectSchema.properties as [Property]?)! {
        // find lists
        if let objectClassName = prop.objectClassName  {
            if let nestedObject = self[prop.name] as? Object {
                mutabledic.setValue(nestedObject.toDictionary(), forKey: prop.name)
            } else if let nestedListObject = self[prop.name] as? ListBase {
                var objects = [AnyObject]()
                for index in 0..<nestedListObject._rlmArray.count  {
                    if let object = nestedListObject._rlmArray[index] as? Object {
                        objects.append(object.toDictionary())
                    }
                }
               
                mutabledic.setObject(objects, forKey: prop.name as NSCopying)

            }
        }
    }
    return mutabledic
}
}
