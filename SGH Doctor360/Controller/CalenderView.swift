//
//  CalenderView.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import FSCalendar
import Toast_Swift

import ASSpinnerView

class CalenderView: UIViewController  ,FSCalendarDelegate, UITableViewDelegate,UITableViewDataSource {
    @IBOutlet var patientcalender: FSCalendar!
    
    
    @IBOutlet var spinnerview: ASSpinnerView!
    
    
    
    @IBOutlet var PatientTable: UITableView!
    
    var ListofPAtient = [DoctorDataList]()
    var SelectedPatient = [DoctorDataList]()
     let user = Doctor.currentUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        spinnerview.spinnerLineWidth = 10
                      spinnerview.spinnerDuration = 0.6
                     spinnerview.spinnerStrokeColor = UIColor.blue.cgColor
        
        
        
        
        
        
       navigationController?.navigationBar.barTintColor = UIColor(red: 30/255, green: 85/255, blue: 132/255, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        
        
               let button1 = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed))
               self.navigationItem.leftBarButtonItem  = button1
               
               
        
        self.patientcalender.delegate = self
        
        
        let nib2 = UINib.init(nibName: "PatientCell", bundle: nil)
        
        
        
        
        
        
        
        self.PatientTable.register(nib2, forCellReuseIdentifier: "PatientCell")
        
        self.PatientTable.delegate = self
        self.PatientTable.dataSource = self
        
        
        
        
        
        
        
        
        
        
        self.PatientTable.tableFooterView = UIView(frame: .zero)

               self.PatientTable.backgroundColor = UIColor.clear
               
               self.PatientTable.separatorStyle = .none
        
        
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadcontentcourse()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        
        
        var ali = ""
        
        
        
        
        ali = formatter.string(from: date)
        
        print(ali)
        
        
        filter(arrayList: self.ListofPAtient, Data: ali)
        
        
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           
           
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PatientDetailsimporve") as? PatientDetailsimporve
           {
               
               
               
               
               
            
            
            vc.PatientSelfinfo = self.SelectedPatient[indexPath.row]
            
            
            vc.OrderFLag = "Calender"
            
            
            self.navigationController?.pushViewController(vc, animated: true)
               
              
               
               
           }
           
           
           
           
           
           
           
           
           
       }
    
    
    
  
    
    @objc func closeBackButtonPressed(){
           self.dismiss(animated: false, completion: nil)
       }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.PatientTable.frame.height * 0.26
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SelectedPatient.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath) as! PatientCell
        
        
        cell.backgroundColor = UIColor.clear
        
        cell.NamePatient.text = SelectedPatient[indexPath.row].patientName!
        
        cell.billNo.text =
            String(SelectedPatient[indexPath.row].registrationno!)
        
        

              if (SelectedPatient[indexPath.row].sex == "Female") {




                  cell.Circualar.image = #imageLiteral(resourceName: "female")

              } else {


                  cell.Circualar.image = #imageLiteral(resourceName: "male")

              }

                                
        
        
        
        cell.dateofbooking.text = String(SelectedPatient[indexPath.row].dateOfBooking!.dropLast(3).replacingOccurrences(of: "T", with: " ", options: .literal, range: nil))
       
        
        
        
        
        cell.age.text = String(SelectedPatient[indexPath.row].dateOfBirth!.dropLast(9))
        
        
        
        
        return cell
    }
    
    
    
    
    func loadcontentcourse(){
        
        
        var  token  =  user?.id
        
        
        let formatter = DateFormatter()
               
               formatter.dateFormat = "yyyy-MM-dd"
               
               
               var ali = ""
               
               
               ali =     formatter.string(from: Date())
               
               
               print(ali)
        
        
        
        
        API.Schedulespataint(Tokenoataiant: token! ,  completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListofPAtient    = respons as! [DoctorDataList]
                
                self.filter(arrayList: self.ListofPAtient, Data: ali)
                
                
                 self.spinnerview.isHidden = true
                self.PatientTable.reloadData()
            } else {
                
                 
                 self.spinnerview.isHidden = true
                
                                       self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
        })
        
        
        
       
       
        
        
    }
    
    
    
    
    func filter(arrayList: [DoctorDataList], Data: String) {
        
        
        
        self.SelectedPatient.removeAll();
        self.PatientTable.reloadData();
        
        
        for Patient in self.ListofPAtient {
            
            
            let choppedString = String(Patient.dateOfBooking!.dropLast(9))
            
            
            if(choppedString == Data) {
                
                self.SelectedPatient.append(Patient)
                
                self.PatientTable.reloadData()
                
            }
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
}
