//
//  ResulatsEX.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/5/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }

        return array
    }
}
