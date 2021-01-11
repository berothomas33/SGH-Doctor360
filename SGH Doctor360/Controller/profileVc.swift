//
//  profileVc.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/10/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class profileVc: UIViewController {
    @IBOutlet var doctorcirculuar: UIImageView!
    
    @IBOutlet var namew: CirulartextFIeld!
    @IBOutlet var Phone: CirulartextFIeld!
    @IBOutlet var NAME: UIStackView!
    @IBOutlet var email: CirulartextFIeld!
    @IBOutlet var Circulaview: cutomview!
    @IBOutlet var userNAMe: UILabel!
    
     
    
    
    @IBOutlet var DEsgintaion: CirulartextFIeld!
    
    @IBOutlet var Department: CirulartextFIeld!
    
     let user = Doctor.currentUser()
    override func viewDidLoad() {
        super.viewDidLoad()

        
     
        
        var name = "male"
        var emay = "email"
        var phonex = "phone"
        var sex = "male"
        
        self.email.setimage(person: emay)
        self.namew.setimage(person: sex)
        self.Phone.setimage(person: phonex)
        
        
    
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        
     self.perform(#selector(circularimage), with: self.doctorcirculuar, afterDelay: 0.00001)
        
        self.namew.text = self.user?.doctorEnglishName
        
        self.email.text = self.user?.email
        
        self.DEsgintaion.text = self.user?.designationEnglishName
        
        self.Department.text = self.user?.departmentEnglishName
        
        
        self.Phone.text = self.user?.phone
        
        
        var imglinkid = " "
               
               
               imglinkid    = user?.employeeID! as! String
               
               
               let uar = "http://41.65.118.181/DocPic/\(imglinkid).jpg"
               
               
               print (uar)
               self.doctorcirculuar.setimg(IMG: self.doctorcirculuar, urlImg: uar)
               
        
        
    }
    
    
    
    
    
     @objc func circularimage(circular : UIImageView) {
               
              

               let radius: CGFloat = self.doctorcirculuar.bounds.size.width / 2.00
               self.doctorcirculuar.layer.cornerRadius = radius
               //CGColor.colorWithHex(hex: "C9DE51")
               self.doctorcirculuar.layer.borderColor = CGColor.colorWithHex(hex: "B3AB80")
               self.doctorcirculuar.layer.borderWidth = 1
               self.doctorcirculuar.layer.masksToBounds = false
               self.doctorcirculuar.clipsToBounds = true
              
               self.doctorcirculuar.isUserInteractionEnabled = true
           }
    
    
    
    
   
}
