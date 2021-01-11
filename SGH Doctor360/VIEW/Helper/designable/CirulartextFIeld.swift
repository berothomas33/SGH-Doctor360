//
//  .swift
//  motamerat
//
//  Created by ebram thomas on 2/23/20.
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

class CirulartextFIeld: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = 1.0
              self.clipsToBounds = true
      self.layer.masksToBounds = false
        self.layer.backgroundColor = CGColor.colorWithHex(hex: "3C3C43")
        
        
        self.textColor = UIColor.white
        self.tintColor = UIColor.white
        
        
    }
    
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let xx   = self.frame.width * 0.085
        
       
        let ddi = self.frame.height / 2
        
        
        let ddy = self.frame.height * 0.2
        let yd = xx + ddi
        
        
        let padding = UIEdgeInsets(top: ddy, left: yd, bottom: ddy, right: yd)
        return bounds.inset(by: padding)
    }
    
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let xx   = self.frame.width * 0.085
        
        
        let ddi = self.frame.height / 2
        
        let yd = xx + ddi
        
        
          let ddy = self.frame.height * 0.2
        
        let padding = UIEdgeInsets(top: ddy, left: yd, bottom: ddy, right: yd)
        return bounds.inset(by: padding)
    }
    
    
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let xx   = self.frame.width * 0.085
               
               
               let ddi = self.frame.height / 2
               
               let yd = xx + ddi
               
               
                 let ddy = self.frame.height * 0.2
               
               let padding = UIEdgeInsets(top: ddy, left: yd, bottom: ddy, right: yd)
               return bounds.inset(by: padding)
    }
    
    func sethintt(person: String) {
        
        

        
        self.attributedPlaceholder = NSAttributedString(string: person, attributes: [
            .foregroundColor: UIColor.gray,
            .font: UIFont.boldSystemFont(ofSize: 12.0)
        ])
        
        
        
    }
    
    
    
    
    func setimage(person: String)  {
        let imageName = person
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        let ddi = self.frame.height / 2
        let dd = ((self.frame.height / 2) - (ddi/1.3))
        //    let dx =  self.frame.width / 20.00
        
        let xx   = self.frame.width * 0.07
        let langs = UserDefaults.standard.value(forKey: "AppleLanguages") as? [String]
        

            
            imageView.frame = CGRect(x: xx , y: dd, width: ddi, height: ddi)
            

        
        self.addSubview(imageView)
    }
    

}

