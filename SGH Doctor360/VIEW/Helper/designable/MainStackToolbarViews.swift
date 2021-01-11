//
//  MAinstavk.swift
//  motamerat
//
//  Created by ebram thomas on 1/5/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class MainStackToolbarViews: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.init(hexString: "1E5584")
   //   static let bleckColorCode = "#F48A8A"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
