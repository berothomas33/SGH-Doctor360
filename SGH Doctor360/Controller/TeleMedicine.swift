
//

import UIKit

import FSCalendar

import RealmSwift
import SwiftyJSON
import Alamofire
import ObjectMapper
import SearchTextField

import Toast_Swift

class TeleMedicine: UIViewController ,FSCalendarDelegate, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listofTEle.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "TeleMedicineTVC", for: indexPath) as! TeleMedicineTVC
               

        cell2.NameofPAtient.text = listofTEle[indexPath.row].name!

        cell2.dateofpatient.text = listofTEle[indexPath.row].date!
               
            
        
        cell2.telemedicine.tag = indexPath.row
        
        cell2.telemedicine.addTarget(self, action: #selector(openLink(sender:)), for: .touchUpInside)
               
               return cell2
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return self.PatientTable.frame.height * 0.26
      }
    
    
    
    @objc func openLink(sender: UIButton){
        
        
         let buttonTag = sender.tag
        
        
        let urlString = self.listofTEle[buttonTag].url!
        
        
        
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
           
            
            if #available(iOS 10.0, *) {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
               UIApplication.shared.openURL(url)
            }
            
            
            
        }
        
        
        
        
        
        
        
//        UIApplication.sharedApplication.openURL(NSURL(string: //"http://www.google.com")!)


    }
    
    
    
    
    
    
    
    
    @IBOutlet var patientcalender: FSCalendar!
    
    
    @IBOutlet var PatientTable: UITableView!
    
    
    var listofTEle = [TeleMedicineOBJEct]()
    
    
     let userx = Doctor.currentUser()
    var user2 : PCBaseModel2?
    

    override func viewDidLoad() {
        
        
        
        
        
       
                      
                      let nib3 = UINib.init(nibName: "TeleMedicineTVC", bundle: nil)
                      
                      
                      
                      
                      
               self.PatientTable.register(nib3, forCellReuseIdentifier: "TeleMedicineTVC")
        
        
        
        let formatter = DateFormatter()
                      
                      formatter.dateFormat = "yyyy-MM-dd"
                      
                      
                      var ali = ""
                      
                      
                      ali =     formatter.string(from: Date())
                      
                      
                      print(ali)
               
        
        
        
        self.PatientTable.dataSource = self
        self.PatientTable.delegate = self
        
        
        self.patientcalender.delegate = self
        saveapi(Data: ali)
        
        super.viewDidLoad()

    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func saveapi(Data:String) {
        
        var Hospitalid = 0
                         Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                  
        var  tokeny  =  userx?.id
        
        
        let fullPath = "http://41.65.118.186/pms/telemedicine/list/\(Hospitalid)/\(tokeny!)?date=\(Data)"
                
        
        
                let body = ["" : "" ] as! [String : String]
        
        
        
         let Auth_header : HTTPHeaders  = [ "" : "" ]
        
        
        

        
        
        print(fullPath)
       
        
        
        AF.request(fullPath, method: .get ,parameters: body, encoding:URLEncoding.default, headers: nil).responseJSON { (response) in
              
            
            
            
                           print(response)
                           if (response.error != nil)  {
                               
                               
                               
                               print(response)
                               print("****************\(response.error?.localizedDescription)********************")
                               
                               
                               return
                           } else {
                               
                              
                               guard let json = response.value as? [String : Any] else {
                                   return
                               }
                               
                               
                               let user = Mapper<PCBaseModel2>().map(JSON : json)
                               
                            
                            self.user2 = user! as PCBaseModel2
                            
                            if (self.user2?.eData! != nil ) {
                                self.listofTEle = self.user2?.eData! as! [TeleMedicineOBJEct]
                                
                                
                                self.PatientTable.reloadData()
                                
                                
                            }
                               
                            
                               
                               
                               
                               
                           }
                           
            
            
            
            
            
            
            
       
                
                
            }
        
        
       
        
    }
    
    
    
    
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
           
           
           
           let formatter = DateFormatter()
           
           formatter.dateFormat = "yyyy-MM-dd"
           
           
           var ali = ""
           
           
           
           
           ali = formatter.string(from: date)
           
           print(ali)
           
           
          saveapi(Data: ali)
           
           
           
       }
       
    
    
    
    
    
    
  

    
    
    
    
    
    
    
    
    
    
    
    

}
