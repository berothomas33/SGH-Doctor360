//
//  MakeOrderVC.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/3/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import iOSDropDown
import RealmSwift
import SwiftyJSON
import Alamofire
import ObjectMapper
import SearchTextField

class MakeOrderVC: UIViewController, UITableViewDataSource ,UITableViewDelegate   {
    
    
    var notificationToken: NotificationToken?
    
    var notificationToken2: NotificationToken?
    
    var LStStringLAbs = [String]()
    
    @IBOutlet var LabSSelect: LabDropDown!
    
    let realm = RealmService.shared.realm
    
    
    @IBOutlet var trans: UISegmentedControl!
    
    
    
    @IBOutlet var SelectDrugs: DrugDropDown!
    
    @IBOutlet var SelectDiagonsad: DiagonsisDropDown!
    
    @IBOutlet var  DrugsTable : UITableView!
    
    @IBOutlet var  TestTable : UITableView!
    
    
    @IBOutlet var DiagonsisTable :UITableView!
    
    
    var ListOFDrugsloa : Results<DrugsSaved4>!
    var ListOFPrecctopion : Results<PrexcriptionFinalSaved2>!
    
    
    
    
    var ListOFlibs : Results<LabTestSaved>!
    var ListOFlibselected : Results<LabTestSelected>!
    
    
    var ListOFRadioselected : Results<RadiologySaved>!
    
    
    
    var ListOFDiagonsisRe : Results<DiagonsicSaved>?
    
    var ListOFSelectedDiag : Results<DiagonSElectd>?
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == self.DrugsTable) {
            return ListOFPrecctopion.count
            
            
            
            
        } else if (tableView == self.TestTable) {
            
            return ListOFlibselected.count
        } else {
            
            
            return ListOFSelectedDiag!.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == self.DrugsTable) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DrugSelect", for: indexPath) as! DrugSelect
            
            cell.NameofDrugs.text = self.ListOFPrecctopion[indexPath.row].DrugName
            
            
            cell.SetDuration = { dict in
                
                
                
                
                
                RealmService.shared.update(self.ListOFPrecctopion[indexPath.row], with: dict)
                
                
                
                print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
                
                
                
                
                
                
                
            }
            
            
            
            
            
            
            cell.SetRouatayion = { dict in
                
                
                
                
                
                RealmService.shared.update(self.ListOFPrecctopion[indexPath.row], with: dict)
                
                
                
                print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
                
                
                
                
                
                
                
            }
            
            
            
            
            
            
            
            cell.SetFrequency = { name in
                print(name)
                RealmService.shared.update(self.ListOFPrecctopion[indexPath.row], with: name)
                print (self.ListOFPrecctopion!.toArray(ofType: PrexcriptionFinalSaved2.self ))
                
                
            }
            
            
            
            
            
            
            
            return cell
            
            
            
        }
            
        else if (tableView == self.TestTable) {
            
            
           let cell = tableView.dequeueReusableCell(withIdentifier: "LabResulautTCell", for: indexPath) as! LabResulautTCell
            
            
            cell.NameofDrugs.text = self.ListOFSelectedDiag![indexPath.row].Descriptio
            
            
            
            return cell
            
            
            
        } else {
            
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabResulautTCell", for: indexPath) as! LabResulautTCell
            
            
            cell.NameofDrugs.text = self.ListOFSelectedDiag![indexPath.row].Descriptio
            
            
            
            return cell
            
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableView == DrugsTable) {
            return self.DrugsTable.frame.height / 2.2 } else {
            
            
            return 55
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    func MakeOrder(Diagnosis:Array<Dictionary<String,Any>>,Labs: Array<Dictionary<String,Any>>, Perscriptions: Array<Dictionary<String,Any>>, PinNo : String , VisitID : String , Radiology : Array<Dictionary<String,Any>> , SheetID : String) {
        
        
        
        
        
        
        let fullPath = "http://41.65.118.185:2020/api/Order/SaveOrder"
        
        let body = [
            "Diagnosis" : Diagnosis ,
            "Labs" : Labs,
            
            
            
            "DoctorID" : "505" ,
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
                    
                    
                    
                    print(response)
                    print("****************\(response.error?.localizedDescription)********************")
                    
                    
                    return
                } else {
                    
                    print(response.value!)
                    guard let json = response.value as? [String : Any] else {
                        return
                    }
                    
                    print(response)
                    let user = Mapper<PCBaseModel>().map(JSON : json)
                    
                    
                    print(user?.message)
                    
                    
                    
                    
                }
                
                
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func loadNotes() {
        
        
        
        
        
        let realm = RealmService.shared.realm
        
        
        ListOFPrecctopion = realm.objects(PrexcriptionFinalSaved2.self)
        ListOFlibs = realm.objects(LabTestSaved.self)
        ListOFlibselected = realm.objects(LabTestSelected.self)
        ListOFDrugsloa = realm.objects(DrugsSaved4.self)
        ListOFDiagonsisRe = realm.objects(DiagonsicSaved.self)
        ListOFSelectedDiag = realm.objects(DiagonSElectd.self)
        
        notificationToken = realm.observe { (notification, realm) in
            self.DrugsTable.reloadData()
            self.DiagonsisTable.reloadData()
        }
        
        
        
        
        
        notificationToken2 = realm.observe { (notification, realm) in
            self.TestTable.reloadData()
        }
        
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            //handle error
            print(error ?? "no error detected")
        }
        
        
    }
    
    @IBAction func makeorder(_ sender: Any) {
        
        
        
        
        
        let realm = RealmService.shared.realm
        ListOFlibselected = realm.objects(LabTestSelected.self)
        ListOFSelectedDiag = realm.objects(DiagonSElectd.self)
        
        ListOFPrecctopion = realm.objects(PrexcriptionFinalSaved2.self)
        
        
        ListOFRadioselected = realm.objects(RadiologySaved.self)
        
        
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        self.MakeOrder(Diagnosis:emptyDic3, Labs: emptyDic2, Perscriptions: emptyDic, PinNo: "82706", VisitID: "", Radiology: emptyDic4, SheetID: "2")
    }
    
    
    
    
    func transtoJSon(dictionary :NSDictionary) -> String {
        
        var jsonx : [String: Any] = ["aa": 4]
        
        
        var Sr = ""
        
        
        do {
            
            //Convert to Data
            let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            //Convert back to string. Usually only do this for debugging
            if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
                print(JSONString)
                
                Sr = JSONString
                
                
                print(Sr)
                
            }
            
            //In production, you usually want to try and cast as the root data structure. Here we are casting as a dictionary. If the root object is an array cast as [Any].
            jsonx = try (JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any])!
            
            print(jsonx)
            
            
        } catch {
            // print(error.description)
        }
        
        
        return Sr
        
    }
    
    
    
    
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        notificationToken?.invalidate()
        RealmService.shared.stopObservingErrors(in: self)
    }
    
    
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNotes()
        
        self.SelectDrugs.isSearchEnable = true
        
        let nib2 = UINib.init(nibName: "DrugSelect", bundle: nil)
        
        let nib3 = UINib.init(nibName: "LabResulautTCell", bundle: nil)
        
        
        self.DrugsTable.register(nib2, forCellReuseIdentifier: "DrugSelect")
        
        
        self.DiagonsisTable.register(nib3, forCellReuseIdentifier: "LabResulautTCell")
        
        
        self.TestTable.register(nib3, forCellReuseIdentifier: "LabResulautTCell")
        
        self.DrugsTable.dataSource = self
        self.TestTable.dataSource = self
        self.TestTable.delegate = self
        
        
        
        self.DiagonsisTable.dataSource = self
        
        self.DiagonsisTable.delegate = self
        
        self.DrugsTable.delegate = self
        
        self.DrugsTable.delegate = self
        
        
        
        
        
        
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
        
        
        
        
        
        
        
        self.SelectDiagonsad.didSelect{(selectedText , index ,id) in
            self.SelectDiagonsad.text = selectedText
            print(selectedText)
            
            self.ListOFDiagonsisRe = self.realm.objects(DiagonsicSaved.self)
            
            
            for item in self.ListOFDiagonsisRe! {
                
                
                if (item.Descriptio == selectedText ) {
                    
                    
                    
                    
                    var Selcelemnt   = DiagonSElectd(ID: Int(item.ID)!, CODE: item.CODE, Descriptio: item.Descriptio)
                    
                    
                    
                    
                    
                    RealmService.shared.create(Selcelemnt)
                    
                }
            }
            
            
            
            
            
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    func toJSONString(de: Array<Dictionary<String,Any>> ) -> String {
        
        
        
        
        
        var Str = ""
        
        
        
        
        
        
        let dat = try! JSONSerialization.data(withJSONObject: de, options: [])
        
        Str = String(data: dat, encoding: String.Encoding.utf8)!
        
        
        
        
        return Str
        
    }
    
    
    
    
    
    
    
}




