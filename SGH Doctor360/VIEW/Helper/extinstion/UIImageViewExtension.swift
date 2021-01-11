//
//  UIImageViewExtension.swift
//  Piano Cafe
//
//  Created by MAHMOUD ABDULKAWY on 4/12/18.
//  Copyright © 2018 DSFH. All rights reserved.
//

import UIKit

import SDWebImage

extension UIImageView {
    func setimg(IMG : UIImageView , urlImg : String){
       let urlthumbImgaURL = URL(string: urlImg + "?token=3cfbe6ff66d3de64196509992170687c")

        
        
       
        do {
       
        IMG.sd_setImage(with: urlthumbImgaURL, placeholderImage: .none, options: .fromLoaderOnly, progress: .none) { (thumbImage, error,chache, imgURL) in
            if thumbImage != nil {
               IMG.image = thumbImage!
            }
            else {
                
                print(urlthumbImgaURL)
            }
        }
        } catch {
            print(error.localizedDescription)
        }
        
        
        
    }
}

