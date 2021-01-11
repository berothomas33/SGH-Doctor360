//
//  AdmittedRequestVC.swift
//  SGH Doctor360
//
//  Created by mac on 11/28/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class AdmittedRequestVC: UIViewController {
    
    @IBOutlet weak var MainStackView: UIStackView!
    
    
    var AdmissionplacesList : [AdmissionPLaces]?
    
    var AdmissionForms : [AdmissionForms]?
    var AdmissionDoctors : [AdmissionForms]?
    var TreatingDoctors : [AdmissionForms]?
    
    private var datePickerView : UIDatePicker?
    
    let welfAddmisonReq = AdmissionRequest()
    
  
    
    @IBOutlet var DroplistAdmssion: DropDown!
    
    
    @IBOutlet var scrollView : UIScrollView!
    
    @IBOutlet var DropFormsAdmssion: DropDown!
    
    
    @IBOutlet var Dropdoctor : DropDown!
    
    
    let user = Doctor.currentUser()
    
    //var
    
    lazy var doneToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneButton], animated: true)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        return toolbar
    }()
    
    lazy var pickerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    
    
    
    
    @objc func doneClicked() {
        // hideDatePicker()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Setupui()
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "UserLoggedIn"), object: nil)
        
        
        
        
        
        
        
        
        
        
        
        
        self.DropFormsAdmssion.didSelect{(selectedText , index ,id) in
            
            
            self.DropFormsAdmssion.text = selectedText
            
            self.welfAddmisonReq.Admittedform    =  self.AdmissionForms![index].ID
            
        }
        
        
        self.Dropdoctor.didSelect{(selectedText , index ,id) in
            
            self.Dropdoctor.text = selectedText
            
            self.welfAddmisonReq.AdmittingDoctor = self.AdmissionDoctors![index].ID
            
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    @objc func showSpinningWheel(_ notification: NSNotification) {
        print(notification.userInfo ?? "")
        
        
        var DictyC   = self.convertToDictionary(text: self.welfAddmisonReq.descriptionY)
        
        
        
        if let dict = notification.userInfo as NSDictionary? {
            print(dict)
            let replacingCurrent = DictyC!.merging(dict as! [String : Any]) { (_, new) in new }
            
            print(replacingCurrent)
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
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
    
    
    
    
    
    @objc func viewTapped(gesturRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    
    
    @objc func datePickerValueChanged ( _: Any) {
        
        print()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.perform(#selector(Setupui), with: nil, afterDelay: 0.1)
        
        loadPlace()
        loadForm()
        
        LoadDoctor()
        
    }
    
    
    
    @objc  func Setupui(){
        
        scrollView.layer.borderWidth = 1.5
        
        scrollView.layer.borderColor=#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        scrollView.layer.cornerRadius =  30
        scrollView.layer.masksToBounds = true
        
        scrollView.clipsToBounds = true
        
        
        
        
        
    }
    
    
    
    
    func loadForm()  {
        
        var  token  =  user?.id
        
        
        
        API.GetAllAdmissionForms( completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.AdmissionForms    = respons as! [AdmissionForms]
                
                
                self.loadFormsplaces(af: self.AdmissionForms!)
                
                
                
                // self.DropFormsAdmssion(af: self.AdmissionForms!)
                
                
            }else {
                
                
                
                
                
                
                self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
        })
        
        
        
        
        
    }
    
    
    
    
    
    
    func  LoadDoctor()  {
        
        var  token  =  user?.id
        
        
        
        API.GetAllAdmissionDoctors( completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.AdmissionDoctors    = respons as! [AdmissionForms]
                
                
                self.loadDoctorplaces(af: self.AdmissionDoctors!)
                
                
                
                
                
            }else {
                
                
                
                
                
                
                self.view.makeToast(error , duration: 2.0, position: .center)
                
                
                
                
                
            }
        })
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func loadlistplaces( af: [AdmissionPLaces]) {
        
        for item in af {
            
            
            
            self.DroplistAdmssion.optionArray.append(item.Name)
            self.DroplistAdmssion.optionIds?.append(item.ID)
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func loadFormsplaces( af: [AdmissionForms]) {
        
        for item in af {
            
            
            
            self.DropFormsAdmssion.optionArray.append(item.Name)
            self.DropFormsAdmssion.optionIds?.append(item.ID)
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    
    
    func loadDoctorplaces( af: [AdmissionForms]) {
        
        for item in af {
            
            
            
            self.Dropdoctor.optionArray.append(item.Name)
            self.Dropdoctor.optionIds?.append(item.ID)
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    
    
    
    func loadPlace()  {
        
        
        
        
        //loadAdmissionForms
        
        var  token  =  user?.id
        
        
        
        API.GetAllAdmissionPlaces(Tokendoctor: token!, completion:  { (respons, error) in
            
            
            
            if(error == "" ) {
                print(respons)
                
                
                self.AdmissionplacesList    = respons as! [AdmissionPLaces]
                
                
                
                
                self.loadlistplaces(af: self.AdmissionplacesList!)
                
                
            }else {
                
                
                
                
                
                
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
