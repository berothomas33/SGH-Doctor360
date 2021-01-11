//
//  SearchController.swift
//  SGH Doctor360
//
//  Created by ebram thomas on 7/20/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class SearchController: ViewController ,UITableViewDelegate,UITableViewDataSource ,UISearchBarDelegate ,UITextFieldDelegate {

    
    @IBOutlet var PatientTable: UITableView!
       
       var ListofPAtient = [DoctorDataList]()
    
    
    @IBOutlet var searchBars: UISearchBar!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return ListofPAtient.count
       }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           
           
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PatientDetailsimporve") as? PatientDetailsimporve
           {
               
               
               
              
              
                   
                   vc.OrderFLag = "SearchO"
                   
               
               
              
               vc.PatientSelfinfo = self.ListofPAtient[indexPath.row]
               
               
               
               self.navigationController?.pushViewController(vc, animated: true)
               
           }
           
           
           
           
           
           
           
           
           
       }
       
    
    
    
    
    
    
    
    func loadSearchbar(Searchu : Int){
      
           
          

           
           self.ListofPAtient.removeAll()
           
         
           
           
           
           
           
           
           
           
           
           
           
              API.Searchpatientscdoctor(Tokenpin: Searchu, completion:   { (respons, error) in



                     if(error == "" ) {


                      self.ListofPAtient    = respons as! [DoctorDataList]
                     
                       
                       self.PatientTable.reloadData()
                     } else {
                         
                         
                       
                       
                       
                                                self.view.makeToast(error , duration: 2.0, position: .center)
                         
                         
                         
                         
                         
                     }
                 })

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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        let nib2 = UINib.init(nibName: "PatientCell", bundle: nil)


               
               
               self.PatientTable.register(nib2, forCellReuseIdentifier: "PatientCell")

                             self.PatientTable.delegate = self
                             self.PatientTable.dataSource = self

               
               self.PatientTable.tableFooterView = UIView(frame: .zero)

               self.PatientTable.backgroundColor = UIColor.clear
               
               
               
               
               self.searchBars.delegate = self
               
               self.searchBars.becomeFirstResponder()
               self.PatientTable.separatorStyle = .none
               
        
        
        
        // Do any additional setup after loading the view.
    }
    

    
    
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            if (searchText.count > 0 ) {
                
                var yr = 0
                    
                if  (containsOnlyLetters(input: searchText) == true) {
                 print("true")
                    
                    self.view.makeToast("Pin must be Number" , duration: 2.0, position: .center)

                    
                } else {
                    print("False")
                    
                    
                                               yr  =   Int(searchText)!
                                    loadSearchbar(Searchu: yr)
                    
                                               print(searchText)
                    
                    
                                    print("Numbers found")
                    
                }
                
                
                
                
    
                
                
                
                
                
                
                
                
                
                
               
                
            }
            
            
            
        }
        
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.PatientTable.frame.height * 0.18
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
           
              cell.dateofbooking.text = ""
           
          brith  = ListofPAtient[indexPath.row].dateOfBirth!
           
           
           
           
           
           

           
           
           cell.age.text = String(brith.dropLast(9))
                    
                    
                    return cell
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
