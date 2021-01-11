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
    
    
    
//    //DispatchQueue(label: "background").async {
//      autoreleasepool {
//        // Get realm and table instances for this thread
//        let realm = try! Realm()
//
//        // Break up the writing blocks into smaller portions
//        // by starting a new transaction
//        for idx1 in 0..<1000 {
//          realm.beginWrite()
//
//          // Add row via dictionary. Property order is ignored.
//          for idx2 in 0..<1000 {
//            realm.create(Person.self, value: [
//              "name": "\(idx1)",
//              "birthdate": Date(timeIntervalSince1970: TimeInterval(idx2))
//            ])
//          }
//
//          // Commit the write transaction
//          // to make this data available to other threads
//          try! realm.commitWrite()
//        }
//      }
//    }
    
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














