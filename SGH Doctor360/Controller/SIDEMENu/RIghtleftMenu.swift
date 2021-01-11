//
//  RIghtleftMenu.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/28/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import SideMenu

class RIghtleftMenu: UISideMenuNavigationController {

    override func viewDidLoad() {
        
//       which is what this bug is about. Setting
        
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
