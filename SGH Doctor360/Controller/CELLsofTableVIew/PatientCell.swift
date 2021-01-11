//
//  PatientCell.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class PatientCell: UITableViewCell {
    @IBOutlet var dateofbooking: Customtextlabel!
    
    @IBOutlet var Circualar: UIImageView!
    @IBOutlet var age: UILabel!
    
    
    
    
    @IBOutlet var billNo: UILabel!
    @IBOutlet var NamePatient: UILabel!
    
    
    var expermient = "experiment"
       
       var  bill = "bill"
       
       var brithday = "birthday"
       var date = "date"
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
          self.perform(#selector(circularimage), with: self.Circualar, afterDelay: 0.00001)
        

        self.dateofbooking.setimage(person: date)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @objc func circularimage(circular : UIImageView) {
              
             

              let radius: CGFloat = self.Circualar.bounds.size.width / 2.00
              self.Circualar.layer.cornerRadius = radius
              //CGColor.colorWithHex(hex: "C9DE51")
              self.Circualar.layer.borderColor = CGColor.colorWithHex(hex: "B3AB80")
              self.Circualar.layer.borderWidth = 1
              self.Circualar.layer.masksToBounds = false
              self.Circualar.clipsToBounds = true
             
              self.Circualar.isUserInteractionEnabled = true
          }
    
}
