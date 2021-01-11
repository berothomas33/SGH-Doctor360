//
//  CustomTextField.swift
//  Wuzfone
//
//  Created by Ahmed Aboulmagd on 9/5/18.
//  Copyright © 2018 Ahmed Aboulmagd. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
      // self.textColor = UIColor.init(hexString: "d4af37")
        
      var bottomLine = CALayer()
  
        let xx   = self.frame.width * 0.08
         let ddi = self.frame.height / 2
        
        let yd = xx + ddi
        

        
        
        
        
        
        
        
       
        
        
        
        
        
        //self.addSubview(imageView)
        
        
        
    }
    
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let xx   = self.frame.width * 0.08
        
       
        let ddi = self.frame.height / 2
        
        
        let ddy = self.frame.height * 0.2
        let yd = xx + ddi
        
        
        let padding = UIEdgeInsets(top: ddy, left: yd, bottom: ddy, right: yd)
        return bounds.inset(by: padding)
    }
    
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let xx   = self.frame.width * 0.08
        
        
        let ddi = self.frame.height / 2
        
        let yd = xx + ddi
        
        
          let ddy = self.frame.height * 0.2
        
        let padding = UIEdgeInsets(top: ddy, left: yd, bottom: ddy, right: yd)
        return bounds.inset(by: padding)
    }
    
    
    
    func sethintt(person: String) {
        
        
//        self.attributedPlaceholder = NSAttributedString(string: person,
//        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//        
      //  self.font = UIFont(name: "SourceSansPro-Regular", size: 7)!
        
        
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
        //    let dx =  self.frame.width / 20.00
        
        let xx   = self.frame.width * 0.08
        let langs = UserDefaults.standard.value(forKey: "AppleLanguages") as? [String]
        
        if langs == nil || !langs!.contains("ar") {
            
            
            imageView.frame = CGRect(x: xx , y: dd, width: ddi, height: ddi)
            
        } else {
            imageView.frame = CGRect(x: self.frame.width-xx , y: dd, width: ddi, height: ddi)
        }
        
        self.addSubview(imageView)
    }
    

}

