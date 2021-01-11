//
//  RadioDoctorList.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import ASSpinnerView


import PDFReader
class RadioDoctorList: UIViewController ,UITableViewDelegate,UITableViewDataSource  {
    
    
    var sata = ""
    
    var Flag = ""
    
    let user = Doctor.currentUser()
    
    @IBOutlet var Spinnerview: ASSpinnerView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListofTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientTestCell", for: indexPath) as! PatientTestCell
        
        cell.NameofPatient.text = self.ListofTest[indexPath.row].patientName
        
        
       
            
      
        sata = self.ListofTest[indexPath.row].testDateTime!
        
        sata = sata.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)

        
        
         let index2 = sata.index(sata.startIndex, offsetBy: 16)
         let index3 = sata.index(sata.startIndex, offsetBy: 16)
         let index4 = sata.index(sata.startIndex, offsetBy: 15)
        sata.remove(at: index2)
        sata.remove(at: index3)
        sata.remove(at: index4)
        
        
        
    sata =    String(sata.dropLast(4))
        
        
          cell.DAteofBoking.text =  sata
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        cell.backgroundColor = UIColor.clear
        
        
        cell.NameofTEst.text =
            
            self.ListofTest[indexPath.row].testName
        
        
       
        
        
        
        
        
        
       
                
                  
        cell.sellyFLAg = self.Flag
                   
          
        
        
        if (self.Flag == "LAB") {
                   
            cell.NameofTEst.setimage(person: "experiment")
                   
                   
                   
                   
               } else {
                   
                   
                  cell.NameofTEst.setimage(person: "xray")
                   
               }
               
        
        
        
        
        
        
        
        
        
        cell.ShowPDFname = {
            
            
            if( self.ListofTest[indexPath.row].pdFlink! != nil && self.ListofTest[indexPath.row].pdFlink! != "") {
            
            print(self.ListofTest[indexPath.row].pdFlink!)
            
            
            let remotePDFDocumentURLPath = self.ListofTest[indexPath.row].pdFlink!
            let remotePDFDocumentURL = URL(string: remotePDFDocumentURLPath)!
            let document = PDFDocument(url: remotePDFDocumentURL)!
            
            
            
            let readerController = PDFViewController.createNew(with: document)
            self.navigationController?.pushViewController(readerController, animated: true)
            } else {
                
                
          
                
                self.view.makeToast("the test pdf not Found" , duration: 2.0, position: .center)
                               
                
                
                
            }
            
            
        }
        
        
        
        
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.TestTable.frame.height * 0.22
    }
    
    
    
    
    
    
    @IBOutlet var TestTable: UITableView!
    
    var ListofTest = [DocotrTestlistReq]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        Spinnerview.spinnerLineWidth = 10
        Spinnerview.spinnerDuration = 0.6
        Spinnerview.spinnerStrokeColor = UIColor.blue.cgColor
        
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 30/255, green: 85/255, blue: 132/255, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        
        
        
        
        
        let button1 = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed))
        self.navigationItem.leftBarButtonItem  = button1
        
        
        
        
        
        
        
        let nib2 = UINib.init(nibName: "PatientTestCell", bundle: nil)
        
        
        
        
        self.TestTable.register(nib2, forCellReuseIdentifier: "PatientTestCell")
        
        self.TestTable.delegate = self
        self.TestTable.dataSource = self
        
        
        
        self.TestTable.tableFooterView = UIView(frame: .zero)
        
        self.TestTable.backgroundColor = UIColor.clear
        
        self.TestTable.separatorStyle = .none
        
        
        
        
        
        
        
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(self.Flag == "LAB") {
            loadcontentcourse2()
            
            
        } else if (self.Flag == "RADIO"){
            
            
            loadcontentcourse()
        }
        
    }
    
    
    @objc func closeBackButtonPressed(){
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    func loadcontentcourse(){
        
        
        var  token  =  user?.id
        
        API.doctorxrayrequsted(Tokendoctor: token!, completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListofTest = respons as! [DocotrTestlistReq]
                  self.Spinnerview.isHidden = true
                self.TestTable.reloadData()
                
                
            }else {
                
                 
                  self.Spinnerview.isHidden = true
                
                
                                       self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
        })
        
    }
    
    
    
    
    
    
    func loadcontentcourse2(){
        
        
        var  token  =  user?.id
        
        
        API.doctorPAtientrequsted(Tokendoctor: token!, completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListofTest = respons as! [DocotrTestlistReq]
                  self.Spinnerview.isHidden = true
                self.TestTable.reloadData()
              
                
            } else {
                
                
                  self.Spinnerview.isHidden = true
                
                 
                                       self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
            
            
        })
        
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
