//
//  PatientDetailsimporve.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/17/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class PatientDetailsimporve: UIViewController ,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate ,UICollectionViewDataSource {
    
    var PatientSelfinfo = DoctorDataList()
    
    var sata = ""
    var brith = ""
    
    
    var OrderFLag = ""
    
    @IBOutlet var Circular: UIImageView!
      
      
     let name3 = Notification.Name("didReceiveData")
    
    
    var imageDataDict:[String: String] = ["image": " "]
    
    
    
    @IBOutlet var Makeorder: UIButton!
    
    
    
    @IBOutlet var dateofbooking: Customtextlabel!
    
      
      
      
      
     
         
         
         @IBOutlet var age: UILabel!
         @IBOutlet var billNo: UILabel!
         @IBOutlet var NamePatient: UILabel!
    
    
    
    
    
    
    
    
    @IBOutlet var HomeCollection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3 
    }
    
    
    
    
    
    
    
    @IBAction func Makew(_ sender: Any) {
        
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DiagonsisSeVCViewController") as? DiagonsisSeVCViewController
                      {
                          
                          
                          
                          
                          
                          
                        vc.Diagpaiatienpin = PatientSelfinfo
                        
                          
                          
                          
                          self.navigationController?.pushViewController(vc, animated: true)
                          
                      }
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let   width  = (self.HomeCollection.frame.width) / 3.03
        let   height = ((self.HomeCollection.frame.height * 0.88))
               
               
               return CGSize(width: width, height: height)
    
    
        
        
        
       
        
    }
        
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCCl", for: indexPath) as! homeCCl
        

        
        var x = ""
        
        x = String(indexPath.row)
        
        var cy = "history"
        
        if (indexPath.row) == 2 {
            
            cell2.bav.image = UIImage(named: cy)
            
        } else {
        
        cell2.bav.image = UIImage(named: x)
        
        
        }
        
        
        return cell2
    }
    

    override func viewDidLoad() {
        
        
       
         
         
         
        
        
        
        
        
        
        
      
        
        
        
        
        
        self.NamePatient.text = PatientSelfinfo.patientName!
              
              self.billNo.text =
                  String(PatientSelfinfo.registrationno!)
              
             
        
        
        
        if (PatientSelfinfo.dateOfBooking != nil  ) {
                       
                    sata    = PatientSelfinfo.dateOfBooking!
                      
                           
                       } else {
                           
                           
                           sata    = PatientSelfinfo.VisitDateTime!

                           
                       }
        
        
        
        
        
        if ( OrderFLag == "SearchO") {
 self.dateofbooking.text  = ""

        } else {
        
        
        
        sata = sata.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)

        
        
         let index2 = sata.index(sata.startIndex, offsetBy: 16)
         let index3 = sata.index(sata.startIndex, offsetBy: 16)
         let index4 = sata.index(sata.startIndex, offsetBy: 15)
        sata.remove(at: index2)
        sata.remove(at: index3)
        sata.remove(at: index4)
        
           self.dateofbooking.text  = sata
        
        }
        
        
        
        if (PatientSelfinfo.sex == "Female") {
                            
                            
                            
                            
                            Circular.image = #imageLiteral(resourceName: "female")
                            
                        } else {
                            
                            
                            Circular.image = #imageLiteral(resourceName: "male")
                            
                        }
        
        
        
         brith  = PatientSelfinfo.dateOfBirth!
        
        
        
                let indexb = brith.index(brith.startIndex, offsetBy: 10, limitedBy: brith.endIndex)
                
                
                
                         brith.remove(at: indexb!)
                        
                        
                        
                        self.age.text = String(brith.dropLast(8))
        
        
        
        
        
        
        
        
    
        
        
                
                
              
        if (OrderFLag == "Calender" || OrderFLag == "OLd" || OrderFLag == "Search" || OrderFLag == "SearchO") {

            self.Makeorder.isHidden = true

        }
        
        
        
        
        
        
        
        
        
         
              
      
        
        let nib2 = UINib.init(nibName: "homeCCl", bundle: nil)

        
        
        
        
        
        
        self.HomeCollection.register(nib2, forCellWithReuseIdentifier: "homeCCl")
        
        
        
        self.HomeCollection.delegate = self
        self.HomeCollection.dataSource = self
        
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 30/255, green: 85/255, blue: 132/255, alpha: 1)
                     UINavigationBar.appearance().tintColor = UIColor.white
         
        
         
         
         
         
         let button1 = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed))
         self.navigationItem.leftBarButtonItem  = button1
        
        
        self.navigationController?.navigationBar.isHidden = false
        
        
        
        
        
        
        
        
                            UINavigationBar.appearance().tintColor = UIColor.white
        
        
        
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 44))
       
        let navItem = UINavigationItem(title: "")

        
        navBar.barTintColor = UIColor(red: 30/255, green: 85/255, blue: 132/255, alpha: 1)
        
        UINavigationBar.appearance().tintColor = UIColor.white
               
        
        view.addSubview(navBar)

    
        
        
        
        
       let doneItem = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed))
        
        
        

        
        
        navItem.leftBarButtonItem = doneItem

        navBar.setItems([navItem], animated: false)
        
        
        
        
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    
    @objc func closeBackButtonPressed(){
            
        
        
        imageDataDict  = ["image": OrderFLag]

           NotificationCenter.default.post(name: name3, object: nil, userInfo: imageDataDict)

        if (OrderFLag == "SearchO") {
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarController") as?  CustomTabBarController
            
          
            
            self.navigationController?.pushViewController(vc!, animated: true)
            
        } else {
        
         navigationController?.popToRootViewController(animated: true)
        }
        
       
    
    }
    
    
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
           
           if (indexPath.row == 0 ) {










              if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VistandlabRAdioController") as? VistandlabRAdioController
                                                     {



                                                        
                                                        vc.Flag = "lab"


                                                        
                                                        vc.PatientSelfinfoVLR = self.PatientSelfinfo
                                                        

                                                         let nav = UINavigationController(rootViewController: vc)


                                                        nav.modalPresentationStyle = .overFullScreen


                                                         self.present(nav, animated: false, completion: nil)

                                                     }














                        }


           if (indexPath.row == 1 ) {
                           

            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VistandlabRAdioController") as? VistandlabRAdioController
                                                   {



                                                      
                                                      vc.Flag = "Radio"


                                                      
                                                      vc.PatientSelfinfoVLR = self.PatientSelfinfo
                                                      

                                                       let nav = UINavigationController(rootViewController: vc)


                                                      nav.modalPresentationStyle = .overFullScreen


                                                       self.present(nav, animated: false, completion: nil)

                                                   }
            
            
            
            
            
            
            



                        }




           if (indexPath.row == 2 ) {





                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VistandlabRAdioController") as? VistandlabRAdioController
                                                                  {



                                                                     
                                                                     vc.Flag = "VisitTable"


                                                                     
                                                                     vc.PatientSelfinfoVLR = self.PatientSelfinfo
                                                                     

                                                                      let nav = UINavigationController(rootViewController: vc)


                                                                      nav.modalPresentationStyle = .overFullScreen


                                                                      self.present(nav, animated: false, completion: nil)

                                                                  }

            
            
            
            
            
            
            










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
