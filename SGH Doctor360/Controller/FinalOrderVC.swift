//
//  FinalOrderVC.swift
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

import ASSpinnerView








class FinalOrderVC: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    
    
    var Finalpatore = DoctorDataList()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        
        
        if (tableView == TestTable) {
            
            return ListOFlibselected.count
            
        } else if (tableView == TestTable2) {
            return ListOFRadioselected.count
        }
        else {
            return ListOFProcedureselected.count
        }
        
    }
    
    @IBOutlet var spinnerview: ASSpinnerView!
    
    var selfpinnio = ""
    
    
    @IBOutlet var testTable3 : UITableView!
    
    
    @IBOutlet var proceduseDrop : ProcdeureDropDown!
    
    @IBOutlet var RadioSelelcr: RadiologyDropDown!
    
    
    
    
    
    let usery = Doctor.currentUser()
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == TestTable) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabResulautTCell", for: indexPath) as! LabResulautTCell
            
            cell.NameofDrugs.text = self.ListOFlibselected[indexPath.row].name
            
            
            cell.SetDElete = {
                
                RealmService.shared.delete(self.ListOFlibselected[indexPath.row])
                
                
                
                
            }
            
            
            
            
            
            return cell
            
        } else if  (tableView == TestTable2){
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabResulautTCell", for: indexPath) as! LabResulautTCell
            
            cell.NameofDrugs.text = self.ListOFRadioselected[indexPath.row].name
            
            
            
            cell.SetDElete = {
                
                RealmService.shared.delete(self.ListOFRadioselected[indexPath.row])
                
                
                
                
            }
            
            
            
            
            
            return cell
            
            
            
            
            
        } else {
            
            
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabResulautTCell", for: indexPath) as! LabResulautTCell
            
            cell.NameofDrugs.text = self.ListOFProcedureselected[indexPath.row].Name
            
            
            
            cell.SetDElete = {
                
                RealmService.shared.delete(self.ListOFProcedureselected[indexPath.row])
                
                
                
                
            }
            
            
            
            
            
            return cell
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
    }
    
    
    
    
    var notificationToken3: NotificationToken?
    
    
    
    var LStStringLAbs = [String]()
    
    @IBOutlet var LabSSelect: LabDropDown!
    
    let realm = RealmService.shared.realm
    
    
    @IBOutlet var trans: UISegmentedControl!
    
    
    
    
    
    @IBOutlet var  TestTable : UITableView!
    
    
    
    
    
    @IBOutlet var TestTable2: UITableView!
    
    var ListOFSelectedDiag : Results<DiagonSElectd>?
    
    
    
    
    
    
    var ListOFPrecctopion : Results<PrexcriptionFinalSaved2>!
    
    
    
    
    var ListOFlibs : Results<LabTestSaved>!
    var ListOFlibselected : Results<LabTestSelected>!
    
    var ListOFProcedureselected : Results<ProcdeureSelected>!
    
    
    var ListofProcdeureSaved : Results<ProcdeureSaveed>!
    
    
    var ListOFradio : Results<RadiologySaved>!
    
    
    var ListOFRadioselected : Results<RadioSelected>!
    
    
    
    
    
    
    
    
    
    func MakeOrder(Diagnosis:Array<Dictionary<String,Any>>,Labs: Array<Dictionary<String,Any>>, Perscriptions: Array<Dictionary<String,Any>>, PinNo : String , VisitID : Int , Radiology : Array<Dictionary<String,Any>> , SheetID : String) {
        
        
        
        
        spinnerview.isHidden = false
        spinnerview.spinnerLineWidth = 10
        spinnerview.spinnerDuration = 0.6
        spinnerview.spinnerStrokeColor = UIColor.blue.cgColor
        
        
        
        
        
        
        
        
        
        var Hospitalid = 0
        Hospitalid = (HospitaLlists.currenHospital()?.id!)!
        
        
        var USerid = ""
        
        
        
        var  token  = 0
        
        token  =  usery?.id as! Int
        
        
        var fullPath = ""
        
        
        
        
        
        USerid = String(token)
        
        
        if (Hospitalid == 1) {
            
            fullPath  = "http://41.65.118.185/api/Order/SaveOrder?HospitalID=\(Hospitalid)"
            
            
        }
        else {
            
            
            fullPath = "http://84.235.35.111/SGHDoctorMobileApi/api/Order/SaveOrder?HospitalID=\(Hospitalid)"
            
        }
        
        
        
        
        
        
        
        
        print(Diagnosis)
        
        print(Perscriptions)
        print(Radiology)
        print(labs)
        let body = [
            "Diagnosis" : Diagnosis ,
            "Labs" : Labs,
            
            "DoctorID" : USerid ,
            "Perscriptions" : Perscriptions ,
            "PinNo" : PinNo ,
            "VisitID" : VisitID ,
            "Radiology" : Radiology ,
            "SheetID": "2"
            ] as! [String : Any]
        
        
        let Auth_header : HTTPHeaders  = [ "Content-Type" : "application/json" ]
        
        AF.request(fullPath, method: .post ,parameters: body, encoding:
            
            JSONEncoding.default, headers: Auth_header).responseJSON { (response) in
                
                
                
                
                print(response)
                
                
                
                
                if (response.error != nil)  {
                    
                    self.spinnerview.isHidden = true
                    
                    print(response)
                    print("****************\(response.error?.localizedDescription)********************")
                    
                    
                    return
                } else {
                    self.spinnerview.isHidden = true
                    print(response.value!)
                    guard let json = response.value as? [String : Any] else {
                        return
                    }
                    
                    print(response)
                    let user = Mapper<PCBaseModel>().map(JSON : json)
                    
                    self.view.makeToast(user?.message , duration: 2.0, position: .center)
                    
                    
                    if( user?.code == 200 ) {
                        print(user?.message)
                        self.view.makeToast(user?.message , duration: 2.0, position: .center)
                        
                        
                        
                        
                        
                        OperationQueue.main.addOperation {
                            
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            
                            
                            
                            let objVC  = storyboard.instantiateViewController(withIdentifier: "Luncher") as! Luncher
                            
                            
                            
                            
                            
                            self.navigationController?.pushViewController(objVC, animated: true)
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNotes()
        
        
        
        let nib2 = UINib.init(nibName: "DrugSelect", bundle: nil)
        
        let nib3 = UINib.init(nibName: "LabResulautTCell", bundle: nil)
        
        
        
        
        self.testTable3.register(nib3, forCellReuseIdentifier: "LabResulautTCell")
        self.TestTable2.register(nib3, forCellReuseIdentifier: "LabResulautTCell")
        self.TestTable.register(nib3, forCellReuseIdentifier: "LabResulautTCell")
        
        self.testTable3.dataSource = self
        self.testTable3.delegate = self
        self.TestTable.dataSource = self
        self.TestTable.delegate = self
        
        self.TestTable2.dataSource = self
        self.TestTable2.delegate = self
        
        self.LabSSelect.didSelect{(selectedText , index ,id) in
            self.LabSSelect.text = selectedText
            print(selectedText)
            self.ListOFlibs = self.realm.objects(LabTestSaved.self)
            
            
            
            
            for item in self.ListOFlibs {
                
                print(item.name)
                if (item.name == selectedText ) {
                    
                    
                    
                    
                    var Selcelemnt   = LabTestSelected(id: item.id, name: item.name, code: item.code, arabicName: item.arabicName)
                    
                    
                    
                    
                    
                    RealmService.shared.create(Selcelemnt!)
                    
                }
            }
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        self.RadioSelelcr.didSelect{(selectedText , index ,id) in
            self.RadioSelelcr.text = selectedText
            print(selectedText)
            self.ListOFradio = self.realm.objects(RadiologySaved.self)
            
            
            
            
            for item in self.ListOFradio {
                
                print(item.name)
                if (item.name == selectedText ) {
                    
                    
                    
                    
                    let Selcelemnt   = RadioSelected(id: item.id, name: item.name, code: item.code, arabicName: item.arabicName)
                    
                    
                    
                    
                    
                    RealmService.shared.create(Selcelemnt!)
                    
                }
            }
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        self.proceduseDrop.didSelect{(selectedText , index ,id) in
                   self.proceduseDrop.text = selectedText
                   print(selectedText)
                   self.ListofProcdeureSaved = self.realm.objects(ProcdeureSaveed.self)
                   
                   
                   
                   
                   for item in self.ListofProcdeureSaved {
                       
                      
                       if (item.Name == selectedText ) {
                           
                           
                           
                           
                        let Selcelemnt   = ProcdeureSelected(ProcdeuureID: item.ProcdeuureID, Qty: 1, Remarks: "", Name: item.Name)
                           
                           
                           
                           
                           
                        RealmService.shared.create(Selcelemnt)
                           
                       }
                   }
                   
                   
                   
                   
                   
                   
                   
               }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func makeorder(_ sender: Any) {
        
        
        
        
        
        let realm = RealmService.shared.realm
        ListOFlibselected = realm.objects(LabTestSelected.self)
        
        
        
        ListOFRadioselected = realm.objects(RadioSelected.self)
        
        
        ListOFPrecctopion =
            
            realm.objects(PrexcriptionFinalSaved2.self)
        
        
        
        ListOFSelectedDiag =
            
            realm.objects(DiagonSElectd.self)
        
        var emptyDic = Array<Dictionary<String,Any>>()
        var emptyDic2 = Array<Dictionary<String,Any>>()
        var emptyDic3 = Array<Dictionary<String,Any>>()
        
        var emptyDic4 = Array<Dictionary<String,Any>>()
        
        
        for object in ListOFPrecctopion {
            let dictionary = object.toDictionary()
            emptyDic.append(dictionary as! Dictionary<String, Any>)
            
            
        }
        
        
        
        for object in ListOFRadioselected {
            let dictionary = object.toDictionary()
            emptyDic4.append(dictionary as! Dictionary<String, Any>)
            
            
        }
        
        for object in ListOFSelectedDiag! {
            let dictionary = object.toDictionary()
            emptyDic3.append(dictionary as! Dictionary<String, Any>)
            
            
        }
        
        
        
        for object in ListOFlibselected {
            let dictionary = object.toDictionary()
            
            emptyDic2.append(dictionary as! Dictionary<String, Any>)
        }
        
        
        
        
        
        
        
        
        
        var pinnox = ""
        
        
        pinnox  =  String(Finalpatore.registrationno!)
        
        var Visitid = 0
        
        //   if(Finalpatore.)
        if (Finalpatore.VisitID != nil && Finalpatore.VisitID != 0 ) {
            Visitid = Finalpatore.VisitID
        } else {
            Visitid = 0
        }
        
        
        
        
        self.MakeOrder(Diagnosis:emptyDic3, Labs: emptyDic2, Perscriptions: emptyDic, PinNo:pinnox , VisitID: Visitid, Radiology: emptyDic4, SheetID: "2")
    }
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        return 55
        
    }
    
    
    
    
    
    
    func loadNotes() {
        
        
        
        
        
        let realm = RealmService.shared.realm
        
        
        
        ListOFlibs = realm.objects(LabTestSaved.self)
        ListOFradio = realm.objects(RadiologySaved.self)
        ListOFlibselected = realm.objects(LabTestSelected.self)
        ListOFRadioselected = realm.objects(RadioSelected.self)
        ListOFProcedureselected = realm.objects(ProcdeureSelected.self)
        ListofProcdeureSaved = realm.objects(ProcdeureSaveed.self)
        
        
        
        
        
        
        
        
        notificationToken3 = realm.observe { (notification, realm) in
            self.TestTable.reloadData()
            self.TestTable2.reloadData()
            self.testTable3.reloadData()
        }
        
        
        
        
        
        
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            //handle error
            print(error ?? "no error detected")
        }
        
        
    }
    
    
    
    
    
    
    
    
    @IBAction func vhangeType(_ sender: Any) {
        
        
        if(trans.selectedSegmentIndex == 0 ){
            AnimationSlidein()
            loadcontentcourse()
            
        } else if (trans.selectedSegmentIndex == 1){
            
            AnimationSlidein()
            loadcontentcourse3()
            
        } else if (trans.selectedSegmentIndex == 2) {
            
            AnimationSlidein()
            loadcontentcourse223()
            
        }
        
    }
    
    
    func loadcontentcourse() {
        
        
        self.LabSSelect.isHidden = false
        
        self.proceduseDrop.isHidden =  true
        
        
        self.RadioSelelcr.isHidden = true
        
       
        
    
         self.TestTable.isHidden = false
        self.TestTable2.isHidden = true
    
        self.testTable3.isHidden = true
        
        
        
    }
    
    
    
    
    func loadcontentcourse223() {
           
           
        
        
        
        
        
        
        
        
        
           self.LabSSelect.isHidden = true
           
           self.RadioSelelcr.isHidden = true
        
        self.proceduseDrop.isHidden =  false
           
           self.TestTable.isHidden = true
           
           self.TestTable2.isHidden = true
           
        self.testTable3.isHidden = false
           
           
           
       }
    
    
    
    
    
    func loadcontentcourse3() {
        
         self.LabSSelect.isHidden = true
                  
                  self.RadioSelelcr.isHidden = false
               
               self.proceduseDrop.isHidden =  true
                  
                  self.TestTable.isHidden = true
                  
                  self.TestTable2.isHidden = false
                  
               self.testTable3.isHidden = true
        
    }
    
    
    
    
    
    
    
    func AnimationSlidein() {
        
        //self.ListOFlibselected.removeAll()
        
        
        self.testTable3.reloadData()
        self.TestTable.reloadData()
        self.TestTable2.reloadData()
        UIView.animate(
            withDuration: 0.4,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                
                self.TestTable.frame.origin.x = self.TestTable.frame.origin.x + self.TestTable.frame.width
                self.testTable3.frame.origin.x = self.testTable3.frame.origin.x + self.testTable3.frame.width
                
                self.TestTable2.frame.origin.x = self.TestTable2.frame.origin.x + self.TestTable2.frame.width
                
        }) { (completed) in
            
        }
        
        
        
        UIView.animate(
            withDuration: 0.4,
            delay: 0.0,
            options: .curveLinear,
            animations: {
                
                self.TestTable.frame.origin.x = self.TestTable.frame.origin.x - self.TestTable.frame.width
                
                
                 self.testTable3.frame.origin.x = self.testTable3.frame.origin.x - self.testTable3.frame.width
                
                
                self.TestTable2.frame.origin.x = self.TestTable2.frame.origin.x - self.TestTable2.frame.width
                
        }) { (completed) in
            
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
