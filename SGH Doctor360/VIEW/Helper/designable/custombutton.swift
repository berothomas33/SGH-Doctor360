//
//  custombutton.swift
//  Tamm
//
//  Created by ebram thomas on 9/11/19.
//  Copyright © 2019 Youssef Wadea. All rights reserved.
//

import Foundation


import UIKit

class custombutton : UIButton {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth=1.5
        
        layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        //self.textColor = UIColor.white
        
        //setTitleColor(UIColorFromRGB("F21B3F"), for: .normal)
     
        
        setTitleColor(.white, for: .normal)
        
        
        layer.backgroundColor = #colorLiteral(red: 0.1450607777, green: 0.4122252464, blue: 0.5894944072, alpha: 1)
        
        layer.cornerRadius = self.frame.size.height / 2.5
                //override func awakeFromNib() {
                
             clipsToBounds = true
      layer.masksToBounds = false
        
       
        
    }
}
