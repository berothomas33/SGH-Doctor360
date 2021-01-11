//
//  PatientDEtails.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

import PDFReader

class PatientDEtails: UIViewController ,UITableViewDelegate,UITableViewDataSource  {
    
    @IBOutlet var Circular: UIImageView!
    
    var PatientSelfinfo = DoctorDataList()
    
    @IBOutlet var labstest: UISegmentedControl!
    
    
    
    @IBOutlet var dateofbooking: Customtextlabel!
       
       
       @IBOutlet var age: Customtextlabel!
       @IBOutlet var billNo: Customtextlabel!
       @IBOutlet var NamePatient: UILabel!
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(tableView == VisitTable) {
            
            return ListofVisits.count
            
        } else {
            
            return ListofTest.count
            
        }
    }
    
    
    
    
    
    @objc func circularimage(circular : UIImageView) {
        
       

        let radius: CGFloat = self.Circular.bounds.size.width / 2.00
        self.Circular.layer.cornerRadius = radius
        //CGColor.colorWithHex(hex: "C9DE51")
        self.Circular.layer.borderColor = CGColor.colorWithHex(hex: "B3AB80")
        self.Circular.layer.borderWidth = 1
        self.Circular.layer.masksToBounds = false
        self.Circular.clipsToBounds = true
       
        self.Circular.isUserInteractionEnabled = true
    }
    
    
    
    
    
    @IBOutlet var TestTAble: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(tableView == VisitTable) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "VisitCell", for: indexPath) as! VisitCell
            
            
            cell.VisitID.text = String(self.ListofVisits[indexPath.row].visitID!)
            
            
            cell.VisitDatetime.text = self.ListofVisits[indexPath.row].visitDateTime!
            
            
            
        
            cell.ShowVisit = {
                
               
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PreCriptionVC") as? PreCriptionVC
                                                      {
                                                          
        vc.SelfVisitinfo = self.ListofVisits[indexPath.row]
                                                        
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
            
            
            
            
            cell.ShowPDFname = {
                       print(self.ListofTest[indexPath.row].pdFlink!)
                       
                       
                       let remotePDFDocumentURLPath = self.ListofTest[indexPath.row].pdFlink!
                       let remotePDFDocumentURL = URL(string: remotePDFDocumentURLPath)!
                       let document = PDFDocument(url: remotePDFDocumentURL)!
                       
                       
                       
                       let readerController = PDFViewController.createNew(with: document)
                       self.navigationController?.pushViewController(readerController, animated: true)
                       
                       
                       
                   }
            
            
            return cell
            
            
            
            
        }
    }
    
    
    @IBAction func MAkeorder(_ sender: Any) {
        
        
        
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MakeOrderVC") as? MakeOrderVC
               {
                   
                   
                   
                   
                   
                   
                  
                 
                   
                   
                   
                   self.navigationController?.pushViewController(vc, animated: true)
                   
               }
        
        
        
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (tableView == VisitTable) {
            return self.VisitTable.frame.height * 0.34
            
        } else {
            
          return 56
            
            
        }
        
        
    }
    
    @IBOutlet var VisitTable: UITableView!
    
    
    
    var ListofVisits = [Visitlist]()
    
    var ListofTest = [Testlist]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        self.NamePatient.text = PatientSelfinfo.patientName!
        
        self.billNo.text =
            String(PatientSelfinfo.registrationno!)
        
        self.dateofbooking.text = PatientSelfinfo.dateOfBooking
        
        
        self.age.text = PatientSelfinfo.dateOfBirth
        
        let nib2 = UINib.init(nibName: "VisitCell", bundle: nil)
        
        
        let nib = UINib.init(nibName: "TestCell", bundle: nil)
        
        
       navigationController?.navigationBar.barTintColor = UIColor(red: 30/255, green: 85/255, blue: 132/255, alpha: 1)
            UINavigationBar.appearance().tintColor = UIColor.white
        
        let button1 = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed))
               self.navigationItem.leftBarButtonItem  = button1
        
        
        
        
        self.TestTAble.register(nib, forCellReuseIdentifier: "TestCell")
        
        self.VisitTable.register(nib2, forCellReuseIdentifier: "VisitCell")
        
        self.VisitTable.delegate = self
        self.VisitTable.dataSource = self
        
        
        self.TestTAble.delegate = self
        self.TestTAble.dataSource = self
        
        
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
      self.perform(#selector(circularimage), with: self.Circular, afterDelay: 0.00001)
        
        
        loadcontentcourse()
       
    }
    
    
    
    
    
    @objc func closeBackButtonPressed(){
           self.dismiss(animated: false, completion: nil)
       }
    
    
    
    
    func loadcontentcourse(){
        
        
        API.ListVisitpataint(Tokenoataiant: PatientSelfinfo.registrationno! , completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListofVisits    = respons as! [Visitlist]
               
                self.VisitTable.reloadData()
                self.loadlibarotPatient()
            } else {
                
                 
                                       self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
            
            
            
        })
        
    }
    
    
    
    
    
    
    func loadlibarotPatient(){
        
        
        API.libartorypataint(Tokenoataiant: PatientSelfinfo.registrationno!, completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListofTest = respons as! [Testlist]
                
                
                self.TestTAble.reloadData()
                
                
            } else {
                
                 
                                       self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
            
            
            
            
            
            
        })
        
    }
    
    
    
    
    
    
    func loadRAdiotPatient(){
           
           
           API.Radiopataint(Tokenoataiant: PatientSelfinfo.registrationno!, completion:  { (respons, error) in
               
               
               
               if(error == "" ) {
                   print(respons)
                   
                   
                   self.ListofTest = respons as! [Testlist]
                   
                   
                   self.TestTAble.reloadData()
                   
                   
               }
           })
           
       }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func AnimationSlidein() {
           
          self.ListofTest.removeAll()
          
          self.TestTAble.reloadData()
          
       UIView.animate(
           withDuration: 0.4,
           delay: 0.0,
           options: .curveLinear,
           animations: {

              self.TestTAble.frame.origin.x = self.TestTAble.frame.origin.x + self.TestTAble.frame.width

       }) { (completed) in

       }
          
          
          
          UIView.animate(
              withDuration: 0.4,
              delay: 0.0,
              options: .curveLinear,
              animations: {

                 self.TestTAble.frame.origin.x = self.TestTAble.frame.origin.x - self.TestTAble.frame.width

          }) { (completed) in

          }
          
          
          
          
          

             
             
         }
    
    
    
    
    
    
    
    
    
    @IBAction func vhangeType(_ sender: Any) {
           
           
           if(labstest.selectedSegmentIndex == 0 ){
               AnimationSlidein()
         loadlibarotPatient()
           
           } else if (labstest.selectedSegmentIndex == 1){
               
               AnimationSlidein()
               loadRAdiotPatient()
               
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
