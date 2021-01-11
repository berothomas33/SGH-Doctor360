//
//  Customtextlabel.swift
//  motamerat
//
//  Created by ebram thomas on 2/16/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
//
//  CustomTextField.swift
//  Wuzfone
//
//  Created by Ahmed Aboulmagd on 9/5/18.
//  Copyright © 2018 Ahmed Aboulmagd. All rights reserved.
//

import UIKit

class Customtextlabel: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
      var bottomLine = CALayer()
        self.isUserInteractionEnabled = false
       
        

        self.borderStyle = .none
        
        
    }
    
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let xx   = self.frame.width * 0.1092
        
       
      
        
        
        
       
        
        
        
        let ddi = self.frame.height / 1.804
         
         
         
        let dd = self.frame.height * 0.24
         
        
         
         let ddy = self.frame.height * 0.5
        
        
         let yd = xx + ddi
        
        
        let padding = UIEdgeInsets(top: dd, left: yd, bottom: dd, right: yd)
        return bounds.inset(by: padding)
    }
    
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let xx   = self.frame.width * 0.1092
               
              
             
               
               
               
              
               
               
               
               let ddi = self.frame.height / 1.804
                
                
                
               let dd = self.frame.height * 0.24
                
               
                
                let ddy = self.frame.height * 0.5
               
               
                let yd = xx + ddi
        
        let padding = UIEdgeInsets(top: ddy, left: yd, bottom: 0, right: yd)
        return bounds.inset(by: padding)
    }
    
    
    
    func sethintt(person: String) {
        
        

        
        
        self.attributedPlaceholder = NSAttributedString(string: person, attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 12.0)
        ])
        
        
        
    }
    
    
    
    
    func setimage(person: String)  {
        let imageName = person
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        let ddi = self.frame.height / 2
        
        
        
       let dd = ((self.frame.height / 2) - (ddi/2))
        
        let xx   = self.frame.width * 0.065
        
        let ddy = self.frame.height * 0.25
        
        
        let langs = UserDefaults.standard.value(forKey: "AppleLanguages") as? [String]
        
//        if langs == nil || !langs!.contains("ar") {
            
            
            imageView.frame = CGRect(x: xx , y: dd, width: ddi, height: ddi)
            
//        } else {
//            imageView.frame = CGRect(x: self.frame.width-xx , y: ddy, width: ddi, height: ddi)
//        }
        
        
        
        
        
        self.addSubview(imageView)
    }
    

}

