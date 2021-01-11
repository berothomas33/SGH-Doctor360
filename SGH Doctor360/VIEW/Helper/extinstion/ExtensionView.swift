//
//  ExtensionView.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/16/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
import UIKit
extension UIView {

  // OUTPUT 1
   func dropShadow() {
         self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.gray.cgColor
    self.layer.shadowOpacity = 1.5
    self.layer.shadowOffset = CGSize(width: -4, height: 4)
    self.layer.shadowRadius = 1
         self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
         self.layer.shouldRasterize = true
         self.layer.rasterizationScale = UIScreen.main.scale

     }

  // OUTPUT 2
//  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
//    layer.masksToBounds = false
//    layer.shadowColor = color.cgColor
//    layer.shadowOpacity = opacity
//    layer.shadowOffset = offSet
//    layer.shadowRadius = radius
//
//    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//    layer.shouldRasterize = true
//    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//  }
}
