//
//  DrugSelect.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/1/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import RealmSwift
class DrugSelect: UITableViewCell {
    
    @IBOutlet var delete: UIButton!
    
    var SetDElete : (() -> ())?
    
    
    
    var SetDuration  : (([String: String])->())?
    var SetFrequency  : (([String: String])->())?
    @IBOutlet var duarationno: DropDown!
    
    @IBOutlet var BeforeDrop: DropDown!
    
    var SetRouatayion : (([String: String])->())?
    var SetBEforeAfter  : (([String: String])->())?
    var setDuartionNO : (([String: String])->())?
    
    var setQtyNo : (([String: Any])->())?
    
    
    var valueFreQ = 1.00
    var ValDuartion = 1
    var VAlNoDuartion = 1
    var flag = 1
    
    
    var ListOfSELFDUARTION : Results<DuarationSaved>!
    var ListofFrequcy : Results<FreqSaved2>!
    var notificationToken: NotificationToken?
    var ListofRoutaion : Results<RouteAdminSaved2>!
    
    var BEForeArray = ["Before", "After" ,"With"]
    
    
    @IBOutlet var textqty : UITextField!
    @IBAction func deleteFuvtion(_ sender: Any) {
        
        self.SetDElete!()
        
    }
    
    
    @IBOutlet var DUARATION: DropDown!
    
    @IBOutlet var FreqDrop : DropDown!
    
    @IBOutlet var ROuation: DropDown!
    @IBOutlet var NameofDrugs: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let realm = RealmService.shared.realm
        
        ListOfSELFDUARTION = realm.objects(DuarationSaved.self)
        ListofFrequcy = realm.objects(FreqSaved2.self)
        ListofRoutaion = realm.objects(RouteAdminSaved2.self)
        loadlist4(jsonArraym: ListOfSELFDUARTION)
        loadlist5(jsonArraym: ListofFrequcy)
        LoadList6(jsonArraym: ListofRoutaion)
        loadbefore(jsonArraym: BEForeArray)
        loadNo()
        
        
        self.FreqDrop.isSearchEnable = true
        
        self.FreqDrop.text = "Freq"
        
        self.ROuation.text = "RouteOfAdmin"
        
        self.DUARATION.text = "Duration"
        
        self.BeforeDrop.text = "Meal"
        
        
        self.duarationno.text = "No."
        
        
        
        
        
        
        
        self.BeforeDrop.didSelect{(selectedText , index ,id) in
            
            
            
            
            
            
            
            
            
            
            
           
            
            if(self.flag == 2)  {
            self.BeforeDrop.text = selectedText
                var Dict    =    ["BeforeAfter": selectedText  ]
            
            self.SetDuration!(Dict)
            
            } else {
                
                var Dict    =    ["BeforeAfter": ""  ]
                         
                         self.SetDuration!(Dict)
                
                
                
            }
            
            
            
            
            
            
            
            
            
        }
        
        
        self.duarationno.didSelect{(selectedText , index ,id) in
            
          
            if(self.flag == 2)  {
                        self.duarationno.text = selectedText
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  var Dict    =    ["Duration_No": ""  ]
                                  
                                  self.setDuartionNO!(Dict)
                                  
                                  
                                  
                                 
                                  
                                 
                                  
                                  self.setQty1()
                       
                       } else {
                           
                
                var Dict    =    ["Duration_No": " "  ]
                                                 
                                                 self.setDuartionNO!(Dict)
                
                
                
                           
                           
                       }
            
            
            
           
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        self.DUARATION.didSelect{(selectedText , index ,id) in
            
            if (self.flag == 2) {
            
            
             self.DUARATION.text = selectedText
            
            
            
            for item in self.ListOfSELFDUARTION {
                
                
                if (selectedText == item.descriptio) {
                    
                    var Dict    =    ["Duration": selectedText , "DurationID" : String(item.id)  ]
                    
                    self.SetDuration!(Dict)
                    
                }
                
                
                
                
                
            }
            
            
           
            
            
            self.setQty1()
                
                
            } else {
                
              
                var Dict    =    ["Duration": "" , "DurationID" : " "  ]
                                   
                                   self.SetDuration!(Dict)
                
                
                
                
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
        self.FreqDrop.didSelect{(selectedText , index ,id) in
            
            
            if (self.flag == 2 ) {
            
            self.FreqDrop.text = selectedText
            
            for item in self.ListofFrequcy {
                
                
                if (selectedText == item.descriptio) {
                    
                    var Dict    =    ["Frequancy": item.descriptio , "FrequencyID" : String(item.id) ]
                    
                    self.SetFrequency!(Dict)
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
                
            }
            
            
            
            
            self.setQty1()
             
            } else {
        
                
                var Dict    =    ["Frequancy": "" , "FrequencyID" : "" ]
                                   
                                   self.SetFrequency!(Dict)
                
                
                
                
                
                
                
            }
                
                
            
            
        }
        
        
        
        
        
        
        
        
        self.ROuation.didSelect{(selectedText , index ,id) in
            
            if (self.flag == 2) {
            
            self.ROuation.text = selectedText
            
            for item in self.ListofRoutaion {
                
                
                if (selectedText == item.descriptio) {
                    
                    var Dict    =    ["RouteOfAdmin": selectedText  ]
                    
                    self.SetRouatayion!(Dict)
                    
                }
                
                
                
            }
            }
            
            else {
                    
                    var Dict    =    ["RouteOfAdmin": " "  ]
                                       
                                       self.SetRouatayion!(Dict)
                    
                    
            }
            
            
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
    
    func loadlist4(jsonArraym : Results<DuarationSaved> ){
        
        
        
        
        for Patient in jsonArraym {
            
            
            
            
            self.DUARATION.optionArray.append(Patient.descriptio)
            
            
            
            self.DUARATION.optionIds?.append(Patient.id)
            
            
            
        }
        
        
        
        
        
    }
    
    
    func LoadList6(jsonArraym : Results<RouteAdminSaved2> ){
        
        
        
        
        for Patient in jsonArraym {
            
            
            
            
            self.ROuation.optionArray.append(Patient.descriptio)
            
            
            
            self.ROuation.optionIds?.append(Patient.id)
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    func loadlist5(jsonArraym : Results<FreqSaved2> ){
        
        
        
        
        for Patient in jsonArraym {
            
            
            
            
            self.FreqDrop.optionArray.append(Patient.descriptio)
            
            
            
            self.FreqDrop.optionIds?.append(Patient.id)
            
            
            
        }
        
        
        
        
    }
    
    
    
    func loadbefore(jsonArraym : [String] ){
        
        var Before = 0
        
        
        for Patient in jsonArraym {
            
            
            
            
            self.BeforeDrop.optionArray.append(Patient)
            
            
            
            self.BeforeDrop.optionIds?.append(Before + 1 )
            
            
            
        }
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    func setQty1(){
        
        
        
        
        
                   if (self.FreqDrop.text !=  "Freq" || self.FreqDrop.text != "") {
                       
                       for item in self.ListofFrequcy {
                           
                           
                           if (item.descriptio == self.FreqDrop.text) {
                               
                               
                            self.valueFreQ = Double(item.Value)
                               
                               
                               
                               
                           }
                           
                           
                           
                       }
                       
                       
                   } else {
                       
                       
                       self.valueFreQ  = 1.00
                       
                   }
                   
                   
                   
                   //conversionValue
                   
                   
                   
                   if (self.DUARATION.text != "Duration" && self.DUARATION.text != "") {
                       
                       
                       
                       for item in self.ListOfSELFDUARTION {
                           
                           
                           if (item.descriptio == self.DUARATION.text) {
                               
                               
                               self.ValDuartion = item.conversionValue
                               
                               
                               
                               
                           }
                           
                           
                           
                       }
                       
                       
                       
                       
                       
                       
                       
                       
                   } else {
                       
                       
                       self.ValDuartion = 1
                       
                       
                       
                   }
        
        
        
        
        
        
        
        
        if (self.duarationno.text != "No." && self.duarationno.text != "") {
                             
                             
                             
            self.VAlNoDuartion = Int(self.duarationno.text!)!
                             
                             
                             
                             
                             
                             
                             
                             
                         } else {
                             
                             
                             self.ValDuartion = 1
                             
                             
                             
                         }
                   
                   
                   
                   
                   let Dict2  = ["valueFreQ": self.valueFreQ , "ValDuartion" : self.ValDuartion ,"VAlNoDuartion" : self.VAlNoDuartion] as [String : Any]
                   
                   
                   self.setQtyNo!(Dict2)
        
    }
    
    
    
    
    
    
    func loadNo(){
        
        var Before = 0
        
        
        let minutes = 10
        for tickMark in 0..<minutes {
            // render the tick mark each minute (60 times)
            
            
            var id  = "0"
            
            id = String(tickMark)
            self.duarationno.optionArray.append(id)
            
            
            
            self.duarationno.optionIds?.append(tickMark)
            
            
            
            
        }
        
        
        
        
        
    }
    
    
    
}





