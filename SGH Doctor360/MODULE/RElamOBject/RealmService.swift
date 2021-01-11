//
//  RealmService.swift
//  Pick Up Lines
//
//  Created by Kyle Lee on 10/14/17.
//  Copyright © 2017 Kilo Loco. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {
    
    private init() {}
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object ,update: .all)
            }
        } catch {
            post(error)
        }
    }
    
    
    
    func create2<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object )
            }
        } catch {
            post(error)
        }
    }
    
    
    
    
//class func parseJSON<T: Object>(json: JSON, withType: T.Type, propertyMap: [String: (property: (String, JSON), object: Object) -> ()]) {
//    let realm = try! Realm()
//    try! realm.write({
//        for object in json {
//            let newObject = T()
//            for property in object.1 {
//                if let propertyMap = propertyMap[property.0] {
//                    propertyMap(property: property, object: withObject)
//                }
//            }
//            realm.add(newObject)
//        }
//    })
//}
    
    
    
    
    
    
   
    
    func update<T: Object>(_ object: T, with dictionary: [String: Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            post(error)
        }
    }
    
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            post(error)
        }
    }
    
    func post(_ error: Error) {
        NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
    }
    
    func observeRealmErrors(in vc: UIViewController, completion: @escaping (Error?) -> Void) {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("RealmError"),
                                               object: nil,
                                               queue: nil) { (notification) in
                                                completion(notification.object as? Error)
        }
    }
    
    func stopObservingErrors(in vc: UIViewController) {
        NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("RealmError"), object: nil)
    }
    
}














