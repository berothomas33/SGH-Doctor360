//
//  cutomview.swift
//  doctorist
//
//  Created by mac on 3/3/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class cutomview: UIView {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.perform(#selector(circularview), with: nil, afterDelay: 0.1)
       
    }
    
    
   @objc func circularview (){
        
        layer.borderWidth=1.5
         
         layer.borderColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         

    //
    
    
          self.layer.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    self.layer.cornerRadius = self.frame.size.height / 15.5
         
         self.clipsToBounds = true
         self.layer.masksToBounds = false
       
        self.isUserInteractionEnabled = true
        
    }
}
