//
//  PAckagePopUP.swift
//  SGH Doctor360
//
//  Created by mac on 12/5/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import DLRadioButton

class PAckagePopUP: UIViewController {
    
    
    
    @IBOutlet weak var TxtRegular : UITextField!

    
    @IBOutlet weak var TxtCritacal: UITextField!

    @IBOutlet weak var MaxLabtxt: UITextField!
    @IBOutlet weak var NOMAxLab: DLRadioButton!

    @IBOutlet weak var MaxOMaging: UITextField!
    @IBOutlet weak var NOMAxIMaging: DLRadioButton!
    
    @IBOutlet weak var Mxmed: UITextField!
    
    @IBOutlet weak var MaxmedText: UILabel!
    @IBOutlet weak var NOmaxMedivation: DLRadioButton!
    @IBOutlet weak var NoMaxMedic: DLRadioButton!
    
    @IBOutlet weak var Orfree: DLRadioButton!
    
    @IBOutlet weak var Procedurefree: DLRadioButton!
    
    @IBOutlet weak var physicain: DLRadioButton!
   
    @IBOutlet weak var Nursing: DLRadioButton!
    
    
    let nc = NotificationCenter.default

    var SPackage =  AdmittedPackage()

    
    
    @IBAction func StepperRoomREgular(sender: UIStepper) {
        
        var quantity = Int(sender.value)
        self.TxtRegular.text = String(quantity)
        self.SPackage.MaxReqularRoom = quantity

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func StepMediFunc(sender: UIStepper) {
       var quantity = Int(sender.value) * 100
        
        self.Mxmed.text = String(quantity)
        self.SPackage.MaxMedication = Double(quantity)
        
        
        
    }
    
    
    
    @IBAction func StepperRoomCritulacur(sender: UIStepper)
       {
          var quantity = Int(sender.value)
          self.TxtCritacal.text = String(quantity)
       }
    
    
    
    @IBAction func MaxImagSteep(sender: UIStepper) {
        
        var quantity = Int(sender.value) * 100
        self.MaxOMaging.text = String(quantity)
        
        self.SPackage.MaxImaging = Double(quantity)
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    @IBAction func MaxLAbSteppe(sender: UIStepper) {
        
        var quantity = Int(sender.value) * 100
        self.MaxLabtxt.text = String(quantity)
        
        
    }
    
    
   
      override func viewDidLoad() {
        super.viewDidLoad()

       
        self.NOMAxLab.isMultipleSelectionEnabled = true
        self.NOMAxIMaging.isMultipleSelectionEnabled = true
        self.NOmaxMedivation.isMultipleSelectionEnabled = true
        self.NOMAxIMaging.isMultipleSelectionEnabled = true
        self.NOmaxMedivation.isMultipleSelectionEnabled = true
        self.Orfree.isMultipleSelectionEnabled = true
        self.Procedurefree.isMultipleSelectionEnabled = true
        self.physicain.isMultipleSelectionEnabled = true
        self.Nursing.isMultipleSelectionEnabled = true
        
        
//        SPackage =

        
        
   
    }
    
    
    
    
  
    
    
    
    
    
    
   
    @IBAction func amtMed(sender: UIStepper) {
        
        var quantity = Int(sender.value) * 100
        self.MaxLabtxt.text = String(quantity)
        
        
        
    }
    
    
    
    
    

    @IBAction func Save(_ sender: Any) {
    
        self.SPackage.MaxReqularRoom = Int (self.TxtRegular.text!)!
        
      
        
        
        self.SPackage.MaxCriticalRoom =
            Int (self.TxtCritacal.text!)!
        
        
        
        
        self.SPackage.MaxMedicalsupplies =
            
            Double(self.Mxmed.text!)!
        
        
        
        self.SPackage.MaxLabInvestigation =
            Double(self.MaxLabtxt.text!)!
        
        
        self.SPackage.MaxImaging =
            Double(  self.MaxOMaging.text!)!
        
        

        
        
    var Dicty   = self.convertToDictionary(text: self.SPackage.descriptionY)
        
        
        
       
    
        nc.post(name:Notification.Name(rawValue:"UserLoggedIn") , object: nil, userInfo: Dicty)
        
        
        
        self.dismiss(animated: true, completion: nil)
    
        
        
        /*
         
         
         
         
         let dictionaryArray = [["key1": 10], ["key1": 10, "key2": 2], ["key3": 3]]

         let tupleArray: [(String, Int)] = dictionaryArray.flatMap { $0 }
         let dictonary = Dictionary(tupleArray, uniquingKeysWith: { (first, last) in first + last })
         //let dictonary = Dictionary(tupleArray, uniquingKeysWith: +) // also works

         print(dictonary) // ["key2": 2, "key3": 3, "key1": 20]*/
       
    }
    
    
     func convertToDictionary(text: String) -> [String: Any]? {
         if let data = text.data(using: .utf8) {
             do {
                 return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
             } catch {
                 print(error.localizedDescription)
             }
         }
         return nil
     }
    
   
    
    
    
    
    
    

}
