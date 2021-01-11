//
//  constants.swift
//  doctorist
//
//  Created by mac on 1/22/19.
//  Copyright © 2019 mac. All rights reserved.
//

import Foundation
struct Constants {
    //get_specialities.php?//lang=ar
    
    
    
    static let baseUrl = "http://41.65.118.185/api/"
    //static let blueColorCode = "8CCAE5"
    static let bleckColorCode = "#F48A8A"
    static let navigationBarColorCode = "0073C2"
    static let resendTime = 60
    static let dateFormat = "MMM dd, yyyy"
    static let kCompany = "company"
    static let kCurrentOrder = "currentOrder"
   // static var menuActionBar:SWRevealViewController = SWRevealViewController()
    static var openMenu = true
    
    
    static let MY_INSTANCE_ADDRESS = "MY_INSTANCE_ADDRESS" // <- update this

    static let AUTH_URL  = URL(string: "https://\(MY_INSTANCE_ADDRESS)")!
    static let REALM_URL = URL(string: "realms://\(MY_INSTANCE_ADDRESS)/ToDo")!
    
    
}






enum DeliveryState: Int {
    
    case canceled = 0
    case pending = 1
    case rejected = 2
    case accepted = 3
    case inWay = 4
    case arrived = 5
    case delivared = 6
    
}
