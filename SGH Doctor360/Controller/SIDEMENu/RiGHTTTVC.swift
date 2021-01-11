//
//  RiGHTTTVC.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/30/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class RiGHTTTVC: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    
    
   @IBOutlet var doctorcirculuar: UIImageView!
    
    
    
     let user = Doctor.currentUser()
    
    var imageS = ""
    
    @IBOutlet var namew: UILabel!
    @IBOutlet var Phone: UILabel!
    
    
    //LabResulautTCell2
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabResulautTCell2", for: indexPath) as! LabResulautTCell2
        
        
        
        if(indexPath.row == 0 ) {
            
            cell.Showpname.text = "Home"
            
            self.imageS = "ihome3"
            
            cell.Showpname.setimage(person: self.imageS)
            
        } else if (indexPath.row == 1) {
            
            //
            
            cell.Showpname.text = "Profile"
            
            self.imageS = "medical"
            
            cell.Showpname.setimage(person: self.imageS)
            
            
            
            
        } else if(indexPath.row == 2) {
       
            cell.Showpname.text = "My Calender"
                       
                       self.imageS = "icalendar"
                       
                       cell.Showpname.setimage(person: self.imageS)
            
            
            
            
            
        } else if (indexPath.row == 3) {
           
            cell.Showpname.text = "Log Out"
                                  
                                  self.imageS = "iexit"
                                  
                                  cell.Showpname.setimage(person: self.imageS)
            
            
            
        }
        
        cell.backgroundColor = UIColor.clear
        
         return cell
    }
    

    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    @IBOutlet  var PReTable: UITableView!
   
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        
        
        
             if(indexPath.row == 0 ) {
                self.dismiss(animated: true, completion: nil)
               
                 
             } else if (indexPath.row == 1) {
                 
                 //
            
                
                
               
                
                
                if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController
                                                                              {
                                                                                  
                                                                                  
                                                                                  
                                                                                vc.flagprofile = "a"
                                                                                  
                                                                                  
                                                                                  let nav = UINavigationController(rootViewController: vc)
                                                                                  
                                                                                 
                                                                                  nav.modalPresentationStyle = .overFullScreen
                                                                                  
                                                                                  
                                                                                  self.present(nav, animated: false, completion: nil)
                                                                                  
                                                                              }
                
                
                
                
                
                
                
                
                
                 
                 
                 
                 
             } else if(indexPath.row == 2) {
            
              
          if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalenderView") as? CalenderView
                                                                                      {
                                                                                          
                                                                                          
                                                                                          
                                                                                          
                                                                                          
                                                                                          
                                                                                          let nav = UINavigationController(rootViewController: vc)
                                                                                          
                                                                                         
                                                                                          nav.modalPresentationStyle = .overFullScreen
                                                                                          
                                                                                          
                                                                                          self.present(nav, animated: false, completion: nil)
                                                                                          
                                                                                      }
                
                
                
                
                 
                 
                 
             } else if (indexPath.row == 3) {
                
                
                user?.remove()
                
                OperationQueue.main.addOperation {
                                   
                                   let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                   
                                   
                                   
                                   let objVC  = storyboard.instantiateViewController(withIdentifier: "Luncher") as! Luncher
                                   
                                   
                                   
                                   
                                   
                                   self.navigationController?.pushViewController(objVC, animated: true)
                                   
                                   
                                   
                               }
                 
                 
             }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib.init(nibName: "LabResulautTCell2", bundle: nil)
                      
                      
                     
                      
                      self.PReTable.register(nib, forCellReuseIdentifier: "LabResulautTCell2")
        
        
        self.PReTable.delegate = self
         
        
        self.PReTable.dataSource = self
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.perform(#selector(circularimage), with: self.doctorcirculuar, afterDelay: 0.00001)
               
               self.namew.text = self.user?.doctorEnglishName
               
             
               
               
               
               
               self.Phone.text = self.user?.phone
               
               
               var imglinkid = " "
                      
                      
                      imglinkid    = user?.employeeID! as! String
                      
                      
                      let uar = "http://41.65.118.181/DocPic/\(imglinkid).jpg"
                      
                      
                      print (uar)
                      self.doctorcirculuar.setimg(IMG: self.doctorcirculuar, urlImg: uar)
        
        
        
        
        
    }
    
    
    
    @objc func circularimage(circular : UIImageView) {
        
       

        let radius: CGFloat = self.doctorcirculuar.bounds.size.width / 2.00
        self.doctorcirculuar.layer.cornerRadius = radius
        //CGColor.colorWithHex(hex: "C9DE51")
        self.doctorcirculuar.layer.borderColor = CGColor.colorWithHex(hex: "B3AB80")
        self.doctorcirculuar.layer.borderWidth = 1
        self.doctorcirculuar.layer.masksToBounds = false
        self.doctorcirculuar.clipsToBounds = true
       
        self.doctorcirculuar.isUserInteractionEnabled = true
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
