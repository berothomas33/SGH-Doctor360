//
//  coircular.swift
//  doctorist
//
//  Created by mac on 2/4/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class coircular: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.height / 2
        //override func awakeFromNib() {
        
        self.clipsToBounds = true
self.layer.masksToBounds = false
        
    }
    }


