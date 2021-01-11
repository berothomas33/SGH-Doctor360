
//  AllPatientList.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/29/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

import Toast_Swift
import ASSpinnerView


class AllPatientList: UIViewController  ,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate ,UITextFieldDelegate {
    
    
    
 
   
    lazy var searchBars:UISearchBar = UISearchBar()

   var  searchflag = ""
    
    @IBOutlet var typePAtient: UISegmentedControl!
    
    
    private var Patainttype = 1

    
    
    @IBOutlet var PatientTable: UITableView!
       
       var ListofPAtient = [DoctorDataList]()
    
    
    
   let name3 = Notification.Name("didReceiveData")
    
    
    let user = Doctor.currentUser()
    
    //var  = UISearchBar()
    
    
    @IBOutlet var spinnerview: ASSpinnerView!
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.PatientTable.frame.height * 0.18
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListofPAtient.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath) as! PatientCell
                 
                 
        cell.backgroundColor = UIColor.clear
        
        cell.NamePatient.text = ListofPAtient[indexPath.row].patientName!
        
        cell.billNo.text =
            String(ListofPAtient[indexPath.row].registrationno!)
        var brith = ""
           var sata = ""
        
        if (ListofPAtient[indexPath.row].dateOfBooking != nil  ) {
        
     sata    = ListofPAtient[indexPath.row].dateOfBooking!
       
            
        } else {
            
            
            sata    = ListofPAtient[indexPath.row].VisitDateTime!

            
        }
        
        if (ListofPAtient[indexPath.row].sex == "Female") {
            
            
            
            
            cell.Circualar.image = #imageLiteral(resourceName: "female")
            
        } else {
            
            
            cell.Circualar.image = #imageLiteral(resourceName: "male")
            
        }
        
        
       

        
         sata = sata.replacingOccurrences(of: "T", with: " ", options: .literal, range: nil)

        
        
         let index2 = sata.index(sata.startIndex, offsetBy: 16)
         let index3 = sata.index(sata.startIndex, offsetBy: 16)
         let index4 = sata.index(sata.startIndex, offsetBy: 15)
        sata.remove(at: index2)
        sata.remove(at: index3)
        sata.remove(at: index4)
        
        if (searchflag == "Search") {
         cell.dateofbooking.text = " "
        } else {
            
            
            cell.dateofbooking.text = sata
        }
       
        
        
        
        brith  = ListofPAtient[indexPath.row].dateOfBirth!
        
        
        
        
        
        

        
        
        cell.age.text = String(brith.dropLast(9))
                 
                 
                 return cell
    }
    

    
    
    
    private func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
 
    }

    
    
    

     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        if (searchText.count > 0 ) {
            
            var yr = 0
                
            if  (containsOnlyLetters(input: searchText) == true) {
             print("true")
                self.view.makeToast("Pin must be Number" , duration: 2.0, position: .center)

            } else {
                print("False")
                
                
                
                 searchflag = "Search"
                                           yr  =   Int(searchText)!
                                loadSearchbar(Searchu: yr)
                
                                           print(searchText)
                
                
                                print("Numbers found")
                
            }
            
            
            
            
//            let decimalCharacters = CharacterSet.decimalDigits
//
//            let decimalRange = searchText.rangeOfCharacter(from: decimalCharacters)

//            if decimalRange != nil {
//
//
//            }
            
            
            
            
            
            
            
            
            
            
           
            
        }
        
        
        
    }
    
    
    
    
    
    
    //Searchpatientscdoctor
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        spinnerview.spinnerLineWidth = 10
               spinnerview.spinnerDuration = 0.6
              spinnerview.spinnerStrokeColor = UIColor.blue.cgColor
        
        
        
           navigationController?.navigationBar.barTintColor = UIColor(red: 30/255, green: 85/255, blue: 132/255, alpha: 1)
             UINavigationBar.appearance().tintColor = UIColor.white
        
       
        

        
        
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: name3, object: nil)
        
        
        
        
        
        let button1 = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed))
        self.navigationItem.leftBarButtonItem  = button1
       
 let button2 = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed2))
        
        self.navigationItem.rightBarButtonItem  = button2
        
        
        
       
       
        
        
        let nib2 = UINib.init(nibName: "PatientCell", bundle: nil)


        
        
        self.PatientTable.register(nib2, forCellReuseIdentifier: "PatientCell")

                      self.PatientTable.delegate = self
                      self.PatientTable.dataSource = self

        
        self.PatientTable.tableFooterView = UIView(frame: .zero)

        self.PatientTable.backgroundColor = UIColor.clear
        
        
        
        
        self.searchBars.delegate = self
        
        self.searchBars.becomeFirstResponder()
        self.PatientTable.separatorStyle = .none
        
    }
    
    
    
    
    
    @objc func onDidReceiveData(_ notification:Notification) {
        
        


        
        
        if let data = notification.userInfo as? [String: String]
        {
            print(data)
            
            for (name, score) in data
            {
                print("\(name) scored \(score) points!")
           
            
                 searchflag = score
                print(score)
                
                
               
                if(score == "Search") {
                    
                } else if (score == "OLd"){
                    
                    
                    
                   

                    self.typePAtient.selectedSegmentIndex = 2
                     
                    
//                    AnimationSlidein()
//
//                      loadcontentcourse2()
                     
                    
                    
                    
                  
                    
                    
                    
                }else if (score == "New"){
                    
                    
      
                    
//                             AnimationSlidein()
//                             loadcontentcourse3()
                    
                    
                   self.typePAtient.selectedSegmentIndex = 1
                    
                    
                    
                    
                }else if (score == "Current"){
                    self.typePAtient.selectedSegmentIndex = 0
                    
            
                    
                    
                    
                    
//                               AnimationSlidein()
//                           loadcontentcourse()
                    
                }
                
                
                
                
                
                
                
                
            
            
            }
        
        
        
       
        
        
        
        
        
        
        
        }
        
        
        
        
        
        
        // Do something now
    }
    
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
             if textField == searchBars {
                 searchBars.resignFirstResponder()
                 return false
             }
             
             
             
             
             return true
         }
    
    
    
    
    
    func containsOnlyLetters(input: String) -> Bool {
       for chr in input {
          if ((chr >= "a" && chr <= "z") || (chr >= "A" && chr <= "Z") ) {
             return true
          }
       }
       return false
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //containsOnlyLetters
    
    func loadSearchbar(Searchu : Int){
   
        
       

           let  token  =  user?.id
        self.ListofPAtient.removeAll()
        
         searchflag = "Search"
        
        
        
        
        
        
        
        
        
        
        
           API.Searchpatientscdoctor(Tokenpin: Searchu, completion:   { (respons, error) in



                  if(error == "" ) {


                   self.ListofPAtient    = respons as! [DoctorDataList]
                      self.spinnerview.isHidden = true
                    
                    self.PatientTable.reloadData()
                  } else {
                      
                      
                     self.spinnerview.isHidden = true
                    
                    
                                             self.view.makeToast(error , duration: 2.0, position: .center)
                      
                      
                      
                      
                      
                  }
              })

          }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    @objc func closeBackButtonPressed(){
        

        
        
        
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @objc func closeBackButtonPressed2(){
    
          let widthyZ = UIScreen.main.bounds.width * 0.75

                 searchBars.frame = CGRect(x: 0,y: 0,width: widthyZ ,height: 20)
                 
                 searchBars.backgroundColor = UIColor.white
        
         searchBars.placeholder = "Enter  pin"
        
                 let leftNavBarButton = UIBarButtonItem(customView:searchBars)
                 self.navigationItem.rightBarButtonItem = leftNavBarButton
        searchBars.delegate = self
                 self.updateViewConstraints()
                 
      }
   
    
    func loadcontentcourse(){

        
        self.spinnerview.isHidden = false
        

        let  token  =  user?.id
         searchflag = "Current"
        
        API.CurrentListcdoctor(Tokendoctor: token! , completion:  { (respons, error) in



               if(error == "" ) {


                self.ListofPAtient    = respons as! [DoctorDataList]
                 
                 self.spinnerview.isHidden = true
                
                
                self.PatientTable.reloadData()
               } else {
                   
                    
                 self.spinnerview.isHidden = true
                
                
                
                self.view.makeToast(error , duration: 2.0, position: .center)
                   
                   
                   
                   
                   
               }
           })

       }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
     if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PatientDetailsimporve") as? PatientDetailsimporve
        {
            
            
            
            
           
                
                vc.OrderFLag = searchflag
                
            
            
           
            vc.PatientSelfinfo = self.ListofPAtient[indexPath.row]
            
            
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
        
        
        
        
        
        
        
    }
    
    
     func loadcontentcourse3(){

        
        
         self.spinnerview.isHidden = false

        searchflag = "New"
        
        var  token  =  user?.id
        
               API.Newpatientscdoctor(Tokendoctor: token!, completion:  { (respons, error) in



                   if(error == "" ) {
                       print(respons)


                    self.ListofPAtient    = respons as! [DoctorDataList]
    //                   = self.responseCourr
                     self.spinnerview.isHidden = true
                    
                    self.PatientTable.reloadData()
                   } else {
                       
                         self.spinnerview.isHidden = true
                                              self.view.makeToast(error , duration: 2.0, position: .center)
                       
                       
                       
                       
                       
                   }
               })

           }
    
    
    
    
     func loadcontentcourse2(){

        
         self.spinnerview.isHidden = false
        
        
        
        
        searchflag = "OLd"
        var  token  =  user?.id
        
        

               API.oldListcdoctor(Tokendoctor: token!, completion:  { (respons, error) in



                   if(error == "" ) {
                       print(respons)


                    self.ListofPAtient    = respons as! [DoctorDataList]
                    
                    
                     self.spinnerview.isHidden = true
                    
                       self.PatientTable.reloadData()
                   }else {
                       
                        
                          
 self.spinnerview.isHidden = true


                    self.view.makeToast(error , duration: 2.0, position: .center)
                       
                       
                       
                       
                       
                   }
               })

           }
    
    
    

    
    override func viewWillAppear(_ animated: Bool) {
        
        
        
        if( searchflag == "Current") {
            loadcontentcourse()
            
        } else if ( searchflag == "New") {
            
              loadcontentcourse3()
            
        } else if (  searchflag == "OLd") {
                   
                       loadcontentcourse2()
                   
        } else if ( searchflag == "")  {
            
            loadcontentcourse()
        }
    
    
    }
    
    @IBAction func vhangeType(_ sender: Any) {
        
        
        if(typePAtient.selectedSegmentIndex == 0 ){
             searchflag = "Current"
            AnimationSlidein()
        loadcontentcourse()
        
        } else if (typePAtient.selectedSegmentIndex == 1){
            searchflag = "New"
            AnimationSlidein()
            loadcontentcourse3()
            
        } else if (typePAtient.selectedSegmentIndex == 2 ) {
            
             searchflag = "OLd"
            AnimationSlidein()
            loadcontentcourse2()
            
            
            
            
        }
        
    }
    
    
    
    func AnimationSlidein() {
         
        self.ListofPAtient.removeAll()
        
        self.PatientTable.reloadData()
        
     UIView.animate(
         withDuration: 0.4,
         delay: 0.0,
         options: .curveLinear,
         animations: {

            self.PatientTable.frame.origin.x = self.PatientTable.frame.origin.x + self.PatientTable.frame.width

     }) { (completed) in

     }
        
        
        
        UIView.animate(
            withDuration: 0.4,
            delay: 0.0,
            options: .curveLinear,
            animations: {

               self.PatientTable.frame.origin.x = self.PatientTable.frame.origin.x - self.PatientTable.frame.width

        }) { (completed) in

        }
        
        
        
        
        

           
           
       }
}
