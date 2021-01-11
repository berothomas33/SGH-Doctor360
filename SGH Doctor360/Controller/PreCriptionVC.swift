//
//  PreCriptionVC.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/13/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class PreCriptionVC: UIViewController  ,UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet var DIAgonsTV: UILabel!
    
    @IBOutlet var basery: cutomview!
    
    @IBOutlet var Dismiss : UIButton!
    
    
    @IBOutlet var DIAgonsisTV: UILabel!
    
    var SelfVisitinfo : Visitlist?
    
    var LStPreX = [Diagonisclist]()
    
     var PatientSelfiPrescro = DoctorDataList()
    
    
    
    var sata = ""
    var brith = ""
    
    
    var OrderFLag = ""
    
    
    
     var LStDRUGS = [Precrptionlist]()
    
    
    
    
    @IBOutlet var Circular: UIImageView!
      
      
    
    
    
    
    
    @IBOutlet var dateofbooking: Customtextlabel!
    
      
      
      
      
     // @IBOutlet var : Customlabel!
         
         
         @IBOutlet var age: UILabel!
         @IBOutlet var billNo: UILabel!
         @IBOutlet var NamePatient: UILabel!
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return  45
       }
    
    
    
    @IBOutlet var PReTable : UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return LStDRUGS.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "LabResulautTCell", for: indexPath) as! LabResulautTCell
    
      
        cell.Delete.isHidden = true
        
        cell.NameofDrugs.text = self.LStDRUGS[indexPath.row].drugName!
       
        
        
    return cell
    
    }
    

    override func viewDidLoad() {
        
        
        
        
               
               
               let nib = UINib.init(nibName: "LabResulautTCell", bundle: nil)
               
               
              
               
               self.PReTable.register(nib, forCellReuseIdentifier: "LabResulautTCell")
        
        
        
        self.PReTable.delegate = self
        
        self.PReTable.dataSource = self
        
        
        
        
        
        self.NamePatient.text = PatientSelfiPrescro.patientName!
                     
                     self.billNo.text =
                         String(PatientSelfiPrescro.registrationno!)
                     
                    
               
               
               
//               if (PatientSelfiPrescro.dateOfBooking != nil  ) {
//
//                           sata    = PatientSelfiPrescro.dateOfBooking!
//
//
//                              } else {
//
//
//                                  sata    = PatientSelfiPrescro.VisitDateTime!
//
//
//                              }
               
        sata = SelfVisitinfo!.visitDateTime!
               
               
               
               
               sata = sata.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)

               
               
                let index2 = sata.index(sata.startIndex, offsetBy: 16)
                let index3 = sata.index(sata.startIndex, offsetBy: 16)
                let index4 = sata.index(sata.startIndex, offsetBy: 15)
               sata.remove(at: index2)
               sata.remove(at: index3)
               sata.remove(at: index4)
               
                  self.dateofbooking.text  = sata
               
               
               
               
               
               if (PatientSelfiPrescro.sex == "Female") {
                                   
                                   
                                   
                                   
                                   Circular.image = #imageLiteral(resourceName: "female")
                                   
                               } else {
                                   
                                   
                                   Circular.image = #imageLiteral(resourceName: "male")
                                   
                               }
               
               
               
                brith  = PatientSelfiPrescro.dateOfBirth!
               
               
               
                       let indexb = brith.index(brith.startIndex, offsetBy: 10, limitedBy: brith.endIndex)
                       
                       
                       
                                brith.remove(at: indexb!)
                               
                               
                               
                               self.age.text = String(brith.dropLast(9))
               
               
               
        
        
        
        
        
        
        
        
        
        
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadPrescp()
        
    }
    
    
    
    func loadPrescp(){


        API.PatientPRecption( Tokenoataiant :  (SelfVisitinfo?.visitID)! , completion:  { (respons, error) in



                      if(error == "" ) {
                          print(respons)


                       self.LStDRUGS   = respons as! [Precrptionlist]
      
                          self.PReTable.reloadData()
                       
                      } else {
                          
                           
                                                 self.view.makeToast(error , duration: 2.0, position: .center)
                          
                          
                          
                          
                          
                      }
            
            
            
            
            
            
                  })
        
        
        
        
        loadDiagonsi()

              }
    
    
    
    
    
    
    func loadDiagonsi(){


           API.PatientDiagonsis( Tokenoataiant :  (SelfVisitinfo?.visitID)! , completion:  { (respons, error) in



                         if(error == "" ) {
                             print(respons)


                          self.LStPreX  = respons as! [Diagonisclist]
         
                            self.DIAgonsTV.text = self.LStPreX[0].fixedDiagnoses
                         }
                     })

                 }
    
    
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
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
