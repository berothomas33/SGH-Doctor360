//
//  LOginVC.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/11/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

import  Toast_Swift



class LOginVC: UIViewController ,UITextFieldDelegate {
    
    
    var PersonalINfo : Doctor?
    
    var selfHospitallist = [HospitaLlists]()
    @IBOutlet var PAssword: CircularTextFIEld2!
    @IBOutlet var listcategory: DropDown!
    @IBOutlet var DOCtorID: CircularTextFIEld2!
    @IBOutlet var login: custombutton!
    @IBAction func Button(_ sender: Any) {
        if(isValadtion() == true )
        {loginfunc()}
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Hospitallist();
        
        let button1 = UIBarButtonItem(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(self.closeBackButtonPressed))
        self.navigationItem.leftBarButtonItem  = button1
        
        
        
        var emailicon = "name2"
        
        var PAssword = "password"
        
        
//        self.DOCtorID.setimage(person: emailicon)
//        self.PAssword.setimage(person: PAssword)
        self.DOCtorID.sethintt(person: "Enter your ID")
        
        self.PAssword.sethintt(person: "Enter your Password")
        
        
        self.login.isUserInteractionEnabled = true
        
        
        
        self.DOCtorID.delegate = self
        self.PAssword.delegate = self
        
        
        
        
        self.listcategory.didSelect{(selectedText , index ,id) in
            self.listcategory.text = selectedText
            
            
            for object in self.selfHospitallist {
                
                
                if(selectedText == object.hospitalName){
                    
                    object.save()
                    
                    
                }
                
                
                
                
                
                
            }
            
            
        }
        
        
        
    }
        
        func isValadtion () -> Bool{
            
            
            
            if(!self.DOCtorID.text!.isBlank ){
                
                
                if(!self.PAssword.text!.isBlank ){
                    
                    return true
                    
                }else{
                    
                    let errorty = "PAssword field  must not be   empty"
                    
                    print(errorty)
                    self.view.makeToast(errorty , duration: 4.0, position: .center)
                    
                    return false
                    
                }
                
                
                
                
            }else{
                
                
                let errorty = "user name field  must not be   empty"
                
                print(errorty)
                self.view.makeToast(errorty , duration: 4.0, position: .center)
                
                return false
            }
            
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        @objc func closeBackButtonPressed(){
            self.dismiss(animated: false, completion: nil)
        }
        
        
        
        
        
        
        
        func loginfunc(){
            
            
            
            
            var username = ""
            username = self.DOCtorID.text!
            
            
            var password = ""
            password = self.PAssword.text!
            var service = "moodle_mobile_app"
            
            
            API.login(DoctorID: username, Password: password, completion:  { (respons, error) in
                
                print(respons)
                
                if(error == "" ) {
                    print(respons)
                    
                    
                    self.PersonalINfo = respons as! Doctor
                    
                    
                    self.PersonalINfo?.save()
                    
                    self.NAvag();
                    
                    
                } else {
                    
                     
                                           self.view.makeToast(error , duration: 2.0, position: .center)
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                
            })
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        func Hospitallist(){
            
            
            
            
            
            
            
            API.Hospitallist( completion:  { (respons, error) in
                
                print(respons)
                
                if(error == "" ) {
                    print(respons)
                    
                    
                    self.selfHospitallist = respons as! [HospitaLlists]
                    
                    for object in self.selfHospitallist {
                        
                        
                        self.listcategory.optionArray.append(object.hospitalName!)
                        
                        
                        
                        self.listcategory.optionIds?.append(object.id!)
                        
                        
                    }
                    
                    
                    
                    
                    
                }else {
                    
                     
                                           self.view.makeToast(error , duration: 2.0, position: .center)
                    
                    
                    
                    
                    
                }
                
                
                
            })
            
            
            
            
            
            
            
            
        }
        
        
        
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == PAssword {
            textField.resignFirstResponder()
            return false
        }
        
        if textField == DOCtorID {
            textField.resignFirstResponder()
            return false
        }
        
        
        return true
    }
    
    
    
    
        
        
        
        
        func NAvag() {
            
             
            OperationQueue.main.addOperation {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
                
                
                let objVC  = storyboard.instantiateViewController(withIdentifier: "CustomTabBarController") as! CustomTabBarController
                
                
                
                
                
                self.navigationController?.pushViewController(objVC, animated: true)
                
                
                
            }
            
            
            
            
            
            
            
        }
        
        
        
        
}
