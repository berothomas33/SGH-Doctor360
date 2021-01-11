//
//  MessageVc.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/19/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class MessageVc: UIViewController  ,UITextFieldDelegate{
    
    
    @IBOutlet var expandbutton: UIButton!
       
       var flag = 0

      
       @IBOutlet var record: UIButton!
       @IBOutlet var gallery: UIButton!
      
    
    @IBOutlet var WriteMEssage: UITextField!
    
    
    
    @IBOutlet var widthtext: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.WriteMEssage.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           if textField == WriteMEssage {
               textField.resignFirstResponder()
               return false
           }
           
           
           
           
           return true
       }
    
    
    
    
    
    
    
    
    @IBAction func show(_ sender: Any) {
           
           
           if(self.flag == 0) {
           self.widthtext.constant = UIScreen.main.bounds.width * 0.35
           self.gallery.isHidden = false
           
           
         
           self.record.isHidden = false
           self.view.layoutIfNeeded()
               self.flag = 1
                UIView.animate(withDuration: 0.3) {

               
            self.expandbutton.transform = self.expandbutton.transform.rotated(by: CGFloat(M_PI))
                   
                   
                          self.view.layoutIfNeeded()
                        }
               
           } else if (self.flag == 1) {
               
              self.widthtext.constant = UIScreen.main.bounds.width * 0.11
               
                self.record.isHidden = true
                self.gallery.isHidden = true
               self.view.layoutIfNeeded()
                UIView.animate(withDuration: 0.3) {
               
                           
                        self.expandbutton.transform = self.expandbutton.transform.rotated(by: CGFloat(M_PI))
                               
                               
                                      self.view.layoutIfNeeded()
                                    }
               
               
               self.flag = 0
               
               
               
           }
           
       }
    


}
