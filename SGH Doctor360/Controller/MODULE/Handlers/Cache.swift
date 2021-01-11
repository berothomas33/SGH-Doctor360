//
//  Cache.swift
//  Piano Cafe
//
//  Created by MAHMOUD ABDULKAWY on 4/12/18.
//  Copyright © 2018 DSFH. All rights reserved.
//

import UIKit

class Cache: NSObject {
    
    static var token : String? {
        get {
            return Cache.object(key: "token") as? String
            
        }
    }
    static var isTutorialShown : Bool {
        get {
            return Cache.object(key: "isTutorialShown") != nil
        }
        set (isShown){
            if isShown {
                Cache.set(object: isShown, forKey: "isTutorialShown")
            } else {
                Cache.removeObject(key: "isTutorialShown")
            }
        }
    }
    
    private static func archiveUserInfo(info : Any) -> NSData {
        
        return NSKeyedArchiver.archivedData(withRootObject: info) as NSData
    }
    
    class func object(key:String) -> Any? {
        
        if let unarchivedObject = UserDefaults.standard.object(forKey: key) as? Data {
            
            return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data)
        }
        
        return nil
    }
    
    class func set(object : Any? ,forKey key:String) {
        
        let archivedObject = archiveUserInfo(info: object!)
        UserDefaults.standard.set(archivedObject, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func setToken(token: String) {
        Cache.set(object: token, forKey: "token")
    }
    
    class func removeObject(key:String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    class func clearToken() {
        Cache.removeObject(key: "token")
        Cache.removeObject(key: "currentUser")
    }
    
    class func set_order_id(order_id : Int){
       UserDefaults.standard.set(order_id, forKey: "order_id")
        UserDefaults.standard.synchronize()
    }
    
    class func get_order_id() -> Int{
        let order_id = UserDefaults.standard.object(forKey: "order_id") as! Int
        return order_id
    }
    
    class func set_status_account(status : Int){
        UserDefaults.standard.set(status, forKey: "status")
        UserDefaults.standard.synchronize()
    }
    
    class func get_status_account() -> Int{
        let status_accont = UserDefaults.standard.object(forKey: "status") as! Int
        return status_accont
    }
    
    class func remove_status_account(){
        UserDefaults.standard.removeObject(forKey: "status")
        UserDefaults.standard.synchronize()
    }
    
    
}
