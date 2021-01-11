//
//  DrugsDetailsVc.swift
//  SGH Doctor360
//
//  Created by ebram thomas on 9/8/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import Realm
import RealmSwift


import SKRadioButton





class DrugsDetailsVc: UIViewController   {
    
    

    
    
   
    
    
   @IBOutlet var duarationno: DropDown!

    
 
    
    
    
    
    
    @IBOutlet var delete: custombutton!
    
    var idofNotifi : String = ""
    
    
    
    
    
    
    let realm = RealmService.shared.realm
    
    
    
    
    
    
    
    
    @IBAction  func dismisst(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
              
    }
    //  @IBAction func makeorder(_ sender: Any) {
    
    
   
    
    
    
    
    var ListOFDrugsloa : Results<DrugsSaved4>!
    var ListOFPrecctopion : Results<PrexcriptionFinalSaved2>!
    
    var DrugSelected = PrexcriptionFinalSaved2()
    
    
    
   
    
    
    
    
    var valueFreQ = 1.00
    var ValDuartion = 1
    var VAlNoDuartion = 1
    var MAxiamamount = 1
    
    
    var ListOfSELFDUARTION : Results<DuarationSaved>!
    var ListofFrequcy : Results<FreqSaved2>!
    var notificationToken: NotificationToken?
    var ListofRoutaion : Results<RouteAdminSaved2>!
    
    var BEForeArray = ["Before", "After" ,"With"]
    
    
    @IBOutlet var textqty : UITextField!
    
    
    
    @IBOutlet var DUARATION: DropDown!
    
    @IBOutlet var FreqDrop : DropDown!
    
    @IBOutlet var ROuation: DropDown!
    @IBOutlet var NameofDrugs: UILabel!
    
    
    
    
    
    
    func setupGroup3() {

        
        
//        self.view.addSubview(radioGroup)
          
//        self.radioGroup.selectedIndex = 1
//        self.radioGroup.addTarget(self, action: #selector(radioGroupSelected(_:)), for: .valueChanged)
//        
//        
//        
//        radioGroup.selectedTitleColor = .systemBlue
//        radioGroup.selectedTitleColor = .black
//        radioGroup.selectedIndicatorColor = .systemBlue
//        radioGroup.unselectedIndicatorColor = .systemBlue
//        radioGroup.subtitleColor = .lightGray
//        radioGroup.buttonBackgroundColor = .white
//        radioGroup.separatorColor = .lightGray
//        
//        radioGroup.titleFont = .systemFont(ofSize: 16, weight: .medium)
//        radioGroup.subtitleFont = .systemFont(ofSize: 13, weight: .regular)
//        
//        radioGroup.cornerRadius = 14 // Button corner radius, actual for .grouped style
//        radioGroup.buttonHeight = 50
//        radioGroup.subtitleTopOffset = 8 // Subtitle offset from title bottom anchor
//        radioGroup.separatorTopOffset = 8 // Separator offset from title or subtitle (if added) bottom anchor
//        radioGroup.indicatorRingWidth = 2 // Outer ring width of indicator
//        radioGroup.indicatorRingSize = 22 // Indicator outer ring size
//        radioGroup.indicatorCircleInset = 5
        

           
       }
    
    
    
    
//    @objc private func radioGroupSelected(_ sender: ALRadioGroup) {
//        print(sender.selectedIndex)
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGroup3()
        
        let realm = RealmService.shared.realm
        
       
        
        
        
        
        
        ListOFPrecctopion = realm.objects(PrexcriptionFinalSaved2.self)
        
        ListOfSELFDUARTION = realm.objects(DuarationSaved.self)
        ListofFrequcy = realm.objects(FreqSaved2.self)
        ListofRoutaion = realm.objects(RouteAdminSaved2.self)
        loadlist4(jsonArraym: ListOfSELFDUARTION)
        loadlist5(jsonArraym: ListofFrequcy)
        LoadList6(jsonArraym: ListofRoutaion)
     //   loadbefore(jsonArraym: BEForeArray)
        loadNo()
        
        
        
        self.FreqDrop.isSearchEnable = true
        
        self.FreqDrop.text = "Freq"
        
        self.ROuation.text = "RouteOfAdmin"
        
        self.DUARATION.text = "Duration"
        
       // self.BeforeDrop.text = "Meal"
        
        
        self.duarationno.text = "No."
        
        
        
        
        for item in ListOFPrecctopion {
            
            
            if (item.DrugId == idofNotifi ) {
                
                
                self.DrugSelected = item
                
                self.NameofDrugs.text = self.DrugSelected.DrugName
                
            
             
                
                self.MAxiamamount = self.DrugSelected.Max
                
            }
            
            
            
            
            
        }
        
        
        
        
        
        
//        if (self.DrugSelected.BeforeAfter == nil || self.DrugSelected.BeforeAfter == "") {
//
//
//                   self.BeforeDrop.text = "Meal"
//                  } else {
//
//                  self.BeforeDrop.text = self.self.DrugSelected.BeforeAfter
//
//              }
              
              
              
              if (self.DrugSelected.Frequancy == nil || self.DrugSelected.Frequancy == ""  || self.DrugSelected.FrequencyID == nil) {
              
                   self.FreqDrop.text = "Freq"
                  
                   }
              else {
                  
                 self.FreqDrop.text = self.self.DrugSelected.Frequancy
                  
              }
              
              
              if (self.DrugSelected.Duration == nil || self.DrugSelected.Duration == "" ) {
              
                  
                   self.DUARATION.text = "Duration"
               }
              else {
                  
                    self.DUARATION.text = self.self.DrugSelected.Duration
                  
              }
              
              
              if (self.DrugSelected.Duration_No == nil ||  self.DrugSelected.Duration_No == 0   ) {
                  
                    self.duarationno.text = "No."
                   } else {
                  
                
                  
                  self.duarationno.text = String( self.self.DrugSelected.Duration_No)
              }
              
              
              if (self.DrugSelected.RouteOfAdmin == nil   ||  self.DrugSelected.RouteOfAdmin == "") {
                  self.ROuation.text = "RouteOfAdmin"
                  
                  
                  } else {
                  
                   self.ROuation.text = String( self.self.DrugSelected.RouteOfAdmin)
                  
                  
                  
              }
              
              
              
              if (self.DrugSelected.Qty == nil   ||  self.DrugSelected.Qty == "") {
                  self.textqty.text = " "
                  
                  
                  } else {
                  
                   self.textqty.text = self.self.DrugSelected.Qty
                  
                  
                  
              }
        
        
        
        
        
        
        
        
        
        
        
//        self.BeforeDrop.didSelect{(selectedText , index ,id) in
//
//            self.BeforeDrop.text = selectedText
//
//
//
//
//
//
//
//
//
//            var Dict    =    ["BeforeAfter": selectedText  ]
//
//
//
//             RealmService.shared.update(self.DrugSelected, with: Dict)
//
//
//             print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
//
//
//
//
//
//
//
//
//        }
        
        
        self.duarationno.didSelect{(selectedText , index ,id) in
            
            self.duarationno.text = selectedText
            
            
            
            
            
            
            
            
            
            var Dict    =    ["Duration_No": selectedText  ]
            
            
            
            
            RealmService.shared.update(self.DrugSelected, with: Dict)
                                      
                                      
                                       print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
            
            
            
            self.setQty1()
            
            
            
        }
        
        
        
        
        
        
        
        self.DUARATION.didSelect{(selectedText , index ,id) in
            
            self.DUARATION.text = selectedText
            
            
            
            
            for item in self.ListOfSELFDUARTION {
                
                
                if (selectedText == item.descriptio) {
                    
                    var Dict    =    ["Duration": selectedText , "DurationID" : String(item.id)  ]
                    
                    
                   
                           
                           
                           
                            RealmService.shared.update(self.DrugSelected, with: Dict)
                           
                           
                            print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
                    
                    
                }
                
                
                
                
                
            }
            
            
            
            
            
            self.setQty1()
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
        self.FreqDrop.didSelect{(selectedText , index ,id) in
            
            
            self.FreqDrop.text = selectedText
            
            for item in self.ListofFrequcy {
                
                
                if (selectedText == item.descriptio) {
                    
                    var Dict    =    ["Frequancy": item.descriptio , "FrequencyID" : String(item.id) ]
                    
                  
                           
                           
                           
                            RealmService.shared.update(self.DrugSelected, with: Dict)
                           
                           
                            print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
                
            }
            
            
            
            self.setQty1()
            
            
            
            
        }
        
        
        
        
        
        
        
        
        self.ROuation.didSelect{(selectedText , index ,id) in
            
            self.ROuation.text = selectedText
            
            for item in self.ListofRoutaion {
                
                
                if (selectedText == item.descriptio) {
                    
                    var Dict    =    ["RouteOfAdmin": selectedText  ]
                    
                    
                    
                   
                           
                           
                           
                            RealmService.shared.update(self.DrugSelected, with: Dict)
                           
                           
                            print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
                    
                    
                    
                }
                
                
                
            }
        }
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    func loadlist5(jsonArraym : Results<FreqSaved2> ){
        
        
        
        
        for Patient in jsonArraym {
            
            
            
            
            self.FreqDrop.optionArray.append(Patient.descriptio)
            
            
            
            self.FreqDrop.optionIds?.append(Patient.id)
            
            
            
        }
        
        
        
        
    }
    
    
    
//    func loadbefore(jsonArraym : [String] ){
//
//        var Before = 0
//
//
//        for Patient in jsonArraym {
//
//
//
//
//            self.BeforeDrop.optionArray.append(Patient)
//
//
//
//            self.BeforeDrop.optionIds?.append(Before + 1 )
//
//
//
//        }
//
//
//
//
//
//    }
    
    
    
    
    
    
    
    
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
        
        
        self.setQtyNo(name: Dict2)
        
    }
    
    
    
    
    
    func setQtyNo(name : [String: Any]) {
        
        
        
                 var valueFreQ : Double = name["valueFreQ"] as! Double
                 
                 var  ValDuartion : Int = name["ValDuartion"] as! Int
                 
                 var  VAlNoDuartion :Int = name["VAlNoDuartion"] as! Int
                 
        var MAxiamamount = self.MAxiamamount
                 
                 
                  
                                 var qty :Double = (valueFreQ) * Double(VAlNoDuartion) * Double(ValDuartion)
                            var Douse : Double = qty / Double(MAxiamamount)
                    print(Douse)
                 print(ceil(Douse))
                                 
                                 self.textqty.text = String(ceil(Douse))
                 
                
                 
                 
                 
                                 var dict = ["Qty" : String(ceil(Douse))]
                 
        RealmService.shared.update(self.DrugSelected, with: dict)
                 
                     print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
                 
                 
                 
                  
                  
                  
                  
        
        
        
        
        
        
        
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
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
