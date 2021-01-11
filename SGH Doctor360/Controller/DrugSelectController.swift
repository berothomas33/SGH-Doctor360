//
//  DrugSelectController.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/22/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit


import iOSDropDown
import RealmSwift
import SwiftyJSON
import Alamofire
import ObjectMapper
import SearchTextField





class DrugSelectController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    
    
    var notificationToken: NotificationToken?
    
    var Drugaiatienpin = DoctorDataList()
    
    
    
    
    let realm = RealmService.shared.realm
    
    
    
    var flag = 1
    
    
    @IBOutlet var SelectDrugs: DrugDropDown!
    
    
    
    @IBOutlet var  DrugsTable : UITableView!
    
    
    
    
    
    
    
    var ListOFDrugsloa : Results<DrugsSaved4>!
    var ListOFPrecctopion : Results<PrexcriptionFinalSaved2>!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListOFPrecctopion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrugSelect", for: indexPath) as! DrugSelect
        
        cell.NameofDrugs.text = self.ListOFPrecctopion[indexPath.row].DrugName
        
        
        cell.SetDuration = { dict in
            
            
            
            
            
            RealmService.shared.update(self.ListOFPrecctopion[indexPath.row], with: dict)
            
            
            
            print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
            
            
            
            
            
            
            
        }
        
        
        cell.SetDElete = {
            
            
            
            
            
            RealmService.shared.delete(self.ListOFPrecctopion[indexPath.row])
            
            print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
            
            self.DrugsTable.reloadData()
            
        }
        
        
        
        cell.setDuartionNO = { dict in
            
            
            
            
            if(self.flag == 2) {
            
            
            
            
            RealmService.shared.update(self.ListOFPrecctopion[indexPath.row], with: dict)
            
            
            
            print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
            } else {
                
                
                
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DrugsDetailsVc") as? DrugsDetailsVc
                {
                    
                    
                    
                   
                   
                        
                    vc.idofNotifi = self.ListOFPrecctopion[indexPath.row].DrugId
                        
                    
                    
                   
                   
                    
                    
                    
                    self.navigationController?.present(vc, animated: true, completion: nil)
                    
                }
                
                
                
                
                
                
            }
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        cell.SetRouatayion = { dict in
            
            
            
            
            
            RealmService.shared.update(self.ListOFPrecctopion[indexPath.row], with: dict)
            
            
            
            print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        cell.setQtyNo = {
            
            name in
            
            
            
            print(name)
            
            
            
            var valueFreQ : Double = name["valueFreQ"] as! Double
            
            var  ValDuartion : Int = name["ValDuartion"] as! Int
            
            var  VAlNoDuartion :Int = name["VAlNoDuartion"] as! Int
            
            var MAxiamamount = 1
            
            
            
            
             
           
                        
                        
                        
                         for item in self.ListOFDrugsloa {
                                      
                                    
                                      
                                      
                                      if (item.Name == self.ListOFPrecctopion[indexPath.row].DrugName ) {
                        
                                        
                                        MAxiamamount = item.Maximum
                        
                        
                        
                        
                        
                    }
                            
                            
                            
                   print(MAxiamamount)
                            print(valueFreQ)
                            print(VAlNoDuartion)
                            print(ValDuartion)
                            
                            var qty :Double = (valueFreQ) * Double(VAlNoDuartion) * Double(ValDuartion)
             
           
            print(qty)
                            
                            var Douse : Double = qty / Double(MAxiamamount)
               print(Douse)
            print(ceil(Douse))
                            
                            cell.textqty.text = String(ceil(Douse))
            
           
            
            
            
                            var dict = ["Qty" : String(ceil(Douse))]
            
             RealmService.shared.update(self.ListOFPrecctopion[indexPath.row], with: dict)
            
                print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
            
            
            }
             
             
             
             
            
            
            
            
            
            
       
            
            
        }
        
        
        
        cell.SetFrequency = { name in
            print(name)
            RealmService.shared.update(self.ListOFPrecctopion[indexPath.row], with: name)
            print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
            
            
        }
        
        
        cell.selectionStyle = .none
        
        
        
        
        
        if (ListOFPrecctopion[indexPath.row].BeforeAfter == nil || ListOFPrecctopion[indexPath.row].BeforeAfter == "") {
            
            
             cell.BeforeDrop.text = "Meal"
            } else {
            
            cell.BeforeDrop.text = self.ListOFPrecctopion[indexPath.row].BeforeAfter
            
        }
        
        
        
        if (ListOFPrecctopion[indexPath.row].Frequancy == nil || ListOFPrecctopion[indexPath.row].Frequancy == ""  || ListOFPrecctopion[indexPath.row].FrequencyID == nil) {
        
             cell.FreqDrop.text = "Freq"
            
             }
        else {
            
           cell.FreqDrop.text = self.ListOFPrecctopion[indexPath.row].Frequancy
            
        }
        
        
        if (ListOFPrecctopion[indexPath.row].Duration == nil || ListOFPrecctopion[indexPath.row].Duration == "" ) {
        
            
             cell.DUARATION.text = "Duration"
         }
        else {
            
              cell.DUARATION.text = self.ListOFPrecctopion[indexPath.row].Duration
            
        }
        
        
        if (ListOFPrecctopion[indexPath.row].Duration_No == nil ||  ListOFPrecctopion[indexPath.row].Duration_No == 0   ) {
            
              cell.duarationno.text = "No."
             } else {
            
          
            
            cell.duarationno.text = String( self.ListOFPrecctopion[indexPath.row].Duration_No)
        }
        
        
        if (ListOFPrecctopion[indexPath.row].RouteOfAdmin == nil   ||  ListOFPrecctopion[indexPath.row].RouteOfAdmin == "") {
            cell.ROuation.text = "RouteOfAdmin"
            
            
            } else {
            
             cell.ROuation.text = String( self.ListOFPrecctopion[indexPath.row].RouteOfAdmin)
            
            
            
        }
        
        
        
        if (ListOFPrecctopion[indexPath.row].Qty == nil   ||  ListOFPrecctopion[indexPath.row].Qty == "") {
            cell.textqty.text = " "
            
            
            } else {
            
             cell.textqty.text = self.ListOFPrecctopion[indexPath.row].Qty
            
            
            
        }
        
        
        
        
        
        return cell
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableView == DrugsTable) {
            return self.DrugsTable.frame.height / 2.5 } else {
            
            
            return 55
        }
    }
    
    
    
    
    func loadNotes() {
        
        
        
        
        
        let realm = RealmService.shared.realm
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

        ListOFPrecctopion = realm.objects(PrexcriptionFinalSaved2.self)
        
        ListOFDrugsloa = realm.objects(DrugsSaved4.self)
        
        
        notificationToken = realm.observe { (notification, realm) in
            self.DrugsTable.reloadData()
            
        }
        
        
        
        
        
        
        
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            //handle error
            print(error ?? "no error detected")
        }
        
        
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        loadNotes()
        
        
        
        
        
        
        
        
        self.SelectDrugs.isSearchEnable = true
        
        let nib2 = UINib.init(nibName: "DrugSelect", bundle: nil)
        
        
        self.DrugsTable.register(nib2, forCellReuseIdentifier: "DrugSelect")
        
        
        self.DrugsTable.delegate = self
        
        self.DrugsTable.dataSource = self
        
        
        
        
        
        self.DrugsTable.backgroundColor = UIColor.clear
        
        // self.DrugsTable.separatorStyle = .none
        
        
        
        
        self.SelectDrugs.didSelect{(selectedText , index ,id) in
            self.SelectDrugs.text = selectedText
            
            
            
            
            
            self.ListOFDrugsloa = self.realm.objects(DrugsSaved4.self)
            
            
            
            for item in self.ListOFDrugsloa {
                
                
                
                print(item.Name)
                print("selectedText\(item.Name)")
                
                print ("selectedText1 \(selectedText)")
                if (item.Name == selectedText ) {
                    
                    
                    
                    let favourite =
                        
                        PrexcriptionFinalSaved2(DrugName: item.Name, DrugId: item.ItemCode, Remarks: 0, DurationID: "", StrengthNo: item.Strength_No, Strength: item.Strength_Unit, Duration: "", BeforeAfter: "", Frequancy: "", Duration_No: 0, RouteOfAdmin: "", FrequencyID: "" ,Qty: ""  ,MAx: item.Maximum, Stock: item.Stock)
                    
                    
                    
                    
                    RealmService.shared.create(favourite!)
                    
                    
                    
                    
                    
                    
                }
                
                
                
            }
            
            
            
            
            
            
            self.SelectDrugs.backgroundColor = UIColor.clear
            
            //            self.SelectDrugs.separatorStyle =
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    @IBAction func Makew(_ sender: Any) {
        
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FinalOrderVC") as? FinalOrderVC
        {
            
            
            vc.Finalpatore = Drugaiatienpin
            
            
            
            
            
            
            
            
            self.navigationController?.pushViewController(vc, animated: true)
            
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
