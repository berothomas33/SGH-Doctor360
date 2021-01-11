//
//  Luncher.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/4/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift
import Toast_Swift

class Luncher: UIViewController {
    
    
    
    
    
     var notificationToken: NotificationToken?
    
     let user = Doctor.currentUser()
    
    var ListOFFrequency = [Frequncylist]()
  var ListofAdmin = [RouteAdminLIst]()
    
    
    
    var ListOFduaration = [Duarationlistobj]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)

    
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            loadNotes()
    }
    
    
    
    func LoadRouteList() {
              API.Routeadminsapi(completion:  { (respons, error) in
                  
                  
                  
                  if(error == "" ) {
                      
                      
                      
                      self.ListofAdmin = respons as! [RouteAdminLIst]
                       self.SaveRouteResulat(Array: self.ListofAdmin)
                  
                      
                      
                  }else {
                      
                       
                                             self.view.makeToast(error , duration: 2.0, position: .center)
                      
                      
                      
                      
                      
                  }
              })
          
     
    
    
    }
    
    
    

    
    
    
    func loadNotes() {
        
        
       
        
        
        self.navigationController?.navigationBar.isHidden = true
        
        let realm = RealmService.shared.realm
       
        try! realm.write {
                   realm.deleteAll()
               }

        
        RealmService.shared.observeRealmErrors(in: self) { (error) in
            //handle error
            print(error ?? "no error detected")
        }
        
        
        FrequncList()
        
        
    }
    
    
    
    
    
    
   
    
    
    
   
    
    

    
    
    
    
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
    func SaveFreqResulat(Array:[Frequncylist] ) {
        
        
        
        
       
        for item in Array {
            
             var ali = ""
             var ali2 = ""
            
            if (item.arabicName == nil || item.arabicName == "") {
                
                ali = "nulll"
                
            } else {
                
                
                ali = item.arabicName!
            }
            
            
            
            if (item.englishName == nil || item.englishName    == "") {
                           
                ali2 = item.description!
                           
                       } else {
                           
                           
                           ali2 = item.englishName!
                       }
            
            
          
            let Duar = FreqSaved2(id: item.id!, descriptio: item.description!, englishName: ali2, arabicName: ali, codeToOrder: item.codeToOrder!,Value:  item.Value)
                   
            
            RealmService.shared.create(Duar!)
               
            
           

            
        }
        
        
        self.LoadRouteList()
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    func SaveRouteResulat(Array:[RouteAdminLIst]) {
        
        
       
        
       
        for item in Array {
            
            
            var ali = ""
            
            print(item.arabicName)
            if (item.arabicName == nil || item.arabicName == " "
                || item.arabicName == "nil") {
                           
                           item.arabicName = "nulll"
                          ali = "nulll"
                
            } else {
                
                
                
                ali = item.arabicName!
            }
                       
            
             print(ali)
         
            
            
            var Duar = RouteAdminSaved2(id: item.id!, descriptio: item.description!, arabicName: ali, pValue: item.pValue!)
            RealmService.shared.create(Duar!)
            
            
            
            
        }
        
    
      
        
         self.DuarationList()
        
        
        
        
        
        
    }
    
    
    
    
    
    
    func SaveDuarationResulat(Array:[Duarationlistobj] ) {
        
        for item in Array {
            
            

          
            
            
            var ali = ""
                       
                       print(item.arabicName)
                       if (item.arabicName == nil || item.arabicName == " "
                           || item.arabicName == "nil") {
                                      
                                      item.arabicName = "nulll"
                                     ali = "nulll"
                           
                       } else {
                           
                           
                           
                           ali = item.arabicName!
                       }
                                  
                       
                        print(ali)
                    
                       
                       
            var Duar = DuarationSaved(id: item.id!, descriptio: item.description!, pValue: item.pValue!, arabicName: ali, conversionValue: item.conversionValue!)
                       RealmService.shared.create(Duar!)
            
            
            
            
            
            
            
            
        }
        
        
        self.navag()
      
        
    }
    

    
    
    func FrequncList(){
        
        
        API.FreeqListsapi(completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.ListOFFrequency = respons as! [Frequncylist]
              
                
                self.SaveFreqResulat(Array: self.ListOFFrequency)
                
                
            } else {
                
                 
                                       self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
        })
        
          
   
    
    
    }
    
    func DuarationList(){
        
        
        API.Duarationlist(completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
               
                
                self.ListOFduaration = respons as! [Duarationlistobj]
                 self.SaveDuarationResulat(Array: self.ListOFduaration)
                
                
                
            } else {
                
                   self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
            }
        })
        
        
        
    }
    
    
    
    
    func  navag () {
        
        
        
        
        
        var  token  =  user?.id
        
        
        
        if (user == nil) {
      //  if (token! == 0) {

        
        
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "LOginVC") as! LOginVC
               self.navigationController?.pushViewController(newViewController, animated: true)

        
        
        
        
    
    
       // }
        } else {
        
        
        
        
        
        
        
        
                 OperationQueue.main.addOperation {
                     
                     let storyboard = UIStoryboard(name: "Main", bundle: nil)
                     
                     
                     
                     let objVC  = storyboard.instantiateViewController(withIdentifier: "CustomTabBarController") as! CustomTabBarController
                     
                     
                     
                     
                     
                     self.navigationController?.pushViewController(objVC, animated: true)
                     
                     
                     
                 }
                 
        
            }
        
    
    }
    
    
}
