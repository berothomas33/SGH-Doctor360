//
//  ReferallVc.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/18/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class ReferallVc: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    
    
   let user = Doctor.currentUser()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListofTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReFellSTVCells", for: indexPath) as! ReFellSTVCells
        
           cell.NameofPatient.text = self.ListofTest[indexPath.row].patientName
        
        
        
        
        cell.DAteofBoking.text = String((self.ListofTest[indexPath.row].admitDateTime?.dropLast(9))!)
        
        
        
        
                   // cell.DAteofBoking.text =
                        
                        
                        
                        
        
                    cell.backgroundColor = UIColor.clear
        
        
        cell.Refells.text =
        
                        self.ListofTest[indexPath.row].referral
       
        
        
        
        
        
        
        
        
        
        
        
        
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.TestTable.frame.height * 0.22
    }
    
    
    
    
    
    
    @IBOutlet var TestTable: UITableView!
    
    var ListofTest = [ReFerralsList]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 30/255, green: 85/255, blue: 132/255, alpha: 1)
        UINavigationBar.appearance().tintColor = UIColor.white
        
        
        
        
        
        let button1 = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed))
        self.navigationItem.leftBarButtonItem  = button1
        
        
        
        
        
        
        
        let nib2 = UINib.init(nibName: "ReFellSTVCells", bundle: nil)
        
        
        
        
        self.TestTable.register(nib2, forCellReuseIdentifier: "ReFellSTVCells")
        
        self.TestTable.delegate = self
        self.TestTable.dataSource = self
        
        
        
        self.TestTable.tableFooterView = UIView(frame: .zero)
        
        self.TestTable.backgroundColor = UIColor.clear
        
        self.TestTable.separatorStyle = .none
        
        
        
        
        
        
        
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadcontentcourse()
    }
    
    
    @objc func closeBackButtonPressed(){
        self.dismiss(animated: false, completion: nil)
    }
    
    
    
    func loadcontentcourse(){
        
        
        var  token  =  user?.id
        
        
        API.doctorReFerrals(Tokendoctor: token!, completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListofTest = respons as! [ReFerralsList]
                
                self.TestTable.reloadData()
                
                
            } else {
                
                 
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
