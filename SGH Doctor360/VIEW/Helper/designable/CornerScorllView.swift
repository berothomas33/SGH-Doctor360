//
//  CornerScorllView.swift
//  SGH Doctor360
//
//  Created by mac on 12/5/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
//
//  cutomview.swift
//  doctorist
//
//  Created by mac on 3/3/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class CornerScorllView: UIStackView {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.perform(#selector(circularview), with: nil, afterDelay: 0.1)
       
    }
    
    
   @objc func circularview (){
        
        layer.borderWidth=1.5
         
         layer.borderColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         

    
    
    
    self.layer.cornerRadius = 20
         
         self.clipsToBounds = true
         self.layer.masksToBounds = false
       
        self.isUserInteractionEnabled = true
        
    }
}
