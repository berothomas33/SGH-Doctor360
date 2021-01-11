//
//  homeCCl.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/10/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class homeCCl: UICollectionViewCell {
    @IBOutlet var bav: UIImageView!
    
    
    @IBOutlet var mainBackground: UIView!
    
    
    @IBOutlet var shadowLayer: UIView!
    
   // mainBackground
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
         self.perform(#selector(Dropu), with: self.bav, afterDelay: 0.00001)
        
        
        
    }
    
    
    
    
    @objc func Dropu(circular : UIImageView) {
                 
         
        
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
             self.layer.shadowOpacity = 1.5
             self.layer.shadowOffset = CGSize(width: -4, height: 4)
             self.layer.shadowRadius = 1
             self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
             self.layer.shouldRasterize = true
             self.layer.rasterizationScale = UIScreen.main.scale
        
        
        

        self.shadowLayer.dropShadow()
             }
    
    
    

}
