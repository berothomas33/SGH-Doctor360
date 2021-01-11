//
//  DiagonsisSeVCViewController.swift
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



class DiagonsisSeVCViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    
    
    var Diagpaiatienpin = DoctorDataList()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            
            
            return ListOFSelectedDiag!.count
            
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabResulautTCell", for: indexPath) as! LabResulautTCell
        
        
        cell.NameofDrugs.text = self.ListOFSelectedDiag![indexPath.row].Descriptio
    
        
        
        cell.SetDElete = {
            
            RealmService.shared.delete(self.ListOFSelectedDiag![indexPath.row])
                       
                       
            self.DiagonsisTable.reloadData()
            
            
        }
        
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
            return 55
        
    }

    
    
    
    
    
       
       var notificationToken2: NotificationToken?
       
     
       
      
       
       let realm = RealmService.shared.realm
       
       
      
       
       
       
      
       
       @IBOutlet var SelectDiagonsad: DiagonsisDropDown!
       
     
        
       
       
       @IBOutlet var DiagonsisTable :UITableView!
       
       
     
    
       
       
       
     
       
       
       
       var ListOFDiagonsisRe : Results<DiagonsicSaved>?
       
       var ListOFSelectedDiag : Results<DiagonSElectd>?
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNotes()
        
        
         let nib3 = UINib.init(nibName: "LabResulautTCell", bundle: nil)
        
         self.DiagonsisTable.register(nib3, forCellReuseIdentifier: "LabResulautTCell")
        
        
        
        self.DiagonsisTable.dataSource = self
               
               self.DiagonsisTable.delegate = self
        
        
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
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    func loadNotes() {
          
          
          
          
          
          let realm = RealmService.shared.realm
          
          
          
         
          ListOFDiagonsisRe = realm.objects(DiagonsicSaved.self)
        ListOFSelectedDiag = realm.objects(DiagonSElectd.self)
          
          notificationToken2 = realm.observe { (notification, realm) in
             
              self.DiagonsisTable.reloadData()
          }
          
          
          
          
          
         
          
          RealmService.shared.observeRealmErrors(in: self) { (error) in
              //handle error
              print(error ?? "no error detected")
          }
          
          
      }

    
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           
           notificationToken2?.invalidate()
           RealmService.shared.stopObservingErrors(in: self)
       }
       
       
       
       
       
       
       
       override func viewWillAppear(_ animated: Bool) {
           
           
           
           
       }
    
    
    
    @IBAction func Makew(_ sender: Any) {
           
           
           if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DrugSelectController") as? DrugSelectController
                         {
                             
                             
                             
                            vc.Drugaiatienpin = Diagpaiatienpin
                             
                             
                            
                           
                             
                             
                             
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
