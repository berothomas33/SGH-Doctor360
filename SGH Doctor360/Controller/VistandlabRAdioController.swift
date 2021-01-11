//
//  VistandlabRAdioController.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/17/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

import PDFReader

import ASSpinnerView


class VistandlabRAdioController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var Flag:String?
    @IBOutlet var bavky: cutomview!
    
    var ListofVisits = [Visitlist]()
    
    var ListofTest = [Testlist]()
    
    var PatientSelfinfoVLR = DoctorDataList()
    
    @IBOutlet var spinnerview: ASSpinnerView!
    
    
    
    @IBOutlet var MultiTAble : UITableView!
    
    
    @IBAction func MAkeorder(_ sender: Any) {
        
        
        
        
        self.dismiss(animated: true, completion: nil)
        
        
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        if(Flag == "VisitTable") {
            return self.MultiTAble.frame.height * 0.15
            
        } else {
            
            return self.MultiTAble.frame.height * 0.18
            
            
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(Flag == "VisitTable") {
            
            return ListofVisits.count
            
        } else {
            
            return ListofTest.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        if(Flag == "VisitTable") {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VisitCell", for: indexPath) as! VisitCell
            
            
            cell.VisitID.text = String(self.ListofVisits[indexPath.row].visitID!)
            
            var sata = self.ListofVisits[indexPath.row].visitDateTime!
            
            sata = sata.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)

                   
                   
                    let index2 = sata.index(sata.startIndex, offsetBy: 16)
                    let index3 = sata.index(sata.startIndex, offsetBy: 16)
                    let index4 = sata.index(sata.startIndex, offsetBy: 15)
                   sata.remove(at: index2)
                   sata.remove(at: index3)
                   sata.remove(at: index4)
                   
                      
            
            
            
            
            cell.VisitDatetime.text = sata
            
            cell.backgroundColor = UIColor.clear
            
            
            cell.ShowVisit = {
                
                
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreCriptionVC") as? PreCriptionVC
                {
                    
                    vc.SelfVisitinfo = self.ListofVisits[indexPath.row]
                    
                    vc.PatientSelfiPrescro = self.PatientSelfinfoVLR
                    
                    
                    
                    let nav = UINavigationController(rootViewController: vc)
                    
                    
                    nav.modalPresentationStyle = .overFullScreen
                    
                    
                    self.present(nav, animated: false, completion: nil)
                    
                }
                
                
                
                
                
                
                
                
                
                
            }
            
            return cell
            
        } else {
            
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell", for: indexPath) as! TestCell
            
            
            cell.NameOfTest.text = self.ListofTest[indexPath.row].testName!
            
            cell.DateofTesting.text = self.ListofTest[indexPath.row].testDateTime!
            
            
            cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
            
            cell.ShowPDFname = {
                
                
                if (self.ListofTest[indexPath.row].pdFlink! != nil && self.ListofTest[indexPath.row].pdFlink! != "") {
                print(self.ListofTest[indexPath.row].pdFlink!)
                
                
                let remotePDFDocumentURLPath = self.ListofTest[indexPath.row].pdFlink!
                let remotePDFDocumentURL = URL(string: remotePDFDocumentURLPath)!
                let document = PDFDocument(url: remotePDFDocumentURL)!
                
                
                
                let readerController = PDFViewController.createNew(with: document)
                self.navigationController?.pushViewController(readerController, animated: true)
                }
                 else {
                    
                    
                     self.view.makeToast("Test Pdf file not found" , duration: 2.0, position: .center)
                    
                    
                }
                
                
            }
                
                
            
            
            return cell
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        spinnerview.spinnerLineWidth = 10
                      spinnerview.spinnerDuration = 0.6
                     spinnerview.spinnerStrokeColor = UIColor.blue.cgColor
        
        
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 30/255, green: 85/255, blue: 132/255, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        
        
          // self.navigationController?.isNavigationBarHidden = true
        
        let nib2 = UINib.init(nibName: "VisitCell", bundle: nil)
        
        
        let nib = UINib.init(nibName: "TestCell", bundle: nil)
        
        
        
        if(Flag == "VisitTable") {
            
            
            
            
            
            
            self.MultiTAble.register(nib2, forCellReuseIdentifier: "VisitCell")
            
            
        } else {
            
            
            
            
            
            self.MultiTAble.register(nib, forCellReuseIdentifier: "TestCell")
            
            
            
        }
        
        self.MultiTAble.delegate = self
        self.MultiTAble.dataSource = self
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if(Flag == "VisitTable") {
            
            
            loadcontentcourse()
            
            
            
            
            
        } else {
            
            
            if(Flag == "lab") {
                
                labPatient()
                
                
                
            } else if (Flag == "Radio")
                
                
                
            {
                
                
                loadRAdiotPatient()
                
                
                
                
                
                
                
            }
            
            
            
            
            
        }
    }
    
    func loadRAdiotPatient(){
        
        
        API.Radiopataint(Tokenoataiant: PatientSelfinfoVLR.registrationno!, completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListofTest = respons as! [Testlist]
               
                self.spinnerview.isHidden = true

                
                
                self.MultiTAble.reloadData()
                //                self.TestTAble.reloadData()
                
                
            }
            else {
                
                
                 self.spinnerview.isHidden = true
                
                
                
                 
                                       self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
            
            
            
            
        })
        
    }
    
    
    
    
    
    
    func labPatient(){
        
        
        API.libartorypataint(Tokenoataiant: PatientSelfinfoVLR.registrationno!, completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListofTest = respons as! [Testlist]
               
                
                self.spinnerview.isHidden = true

                
                self.MultiTAble.reloadData()
                //                self.TestTAble.reloadData()
                
                
            } else {
                
                 self.spinnerview.isHidden = true

                                       self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
            
            
            
            
            
            
        })
        
    }
    
    
    
    
    
    
    
    //
    
    
    
    
    
    
    
    
    
    func loadcontentcourse(){
        
        
        API.ListVisitpataint(Tokenoataiant: PatientSelfinfoVLR.registrationno! , completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                self.spinnerview.isHidden = true

                
                self.ListofVisits    = respons as! [Visitlist]
                
                
                
                self.MultiTAble.reloadData()
                //                   self.VisitTable.reloadData()
                //                   self.loadlibarotPatient()
            } else {
                
                 self.spinnerview.isHidden = true

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
