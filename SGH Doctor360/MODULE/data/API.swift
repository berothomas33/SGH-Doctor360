//
//  API.swift
//
//

//  Copyright © 2018 DSFH. All rights reserved.
//

import UIKit
import Alamofire
import MapKit
import  ObjectMapper

import Toast_Swift


class API: NSObject {
   //GetAllAdmissionPLaces?DoctorID=202&HospitalID=1
    
    class func doctorxrayrequsted(Tokendoctor : Int , completion :@escaping Handler) {
        
        
        var Hospitalid = 0
               Hospitalid = (HospitaLlists.currenHospital()?.id!)!
        
        
        let uar =  "Doctor/PatientTest?DoctorID=\(Tokendoctor)&DepartmentID=43&HospitalID=\(Hospitalid)"
        
        
        
        
        
        
        
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: DocotrTestlistReq(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    class func GetAllAdmissionPlaces(Tokendoctor : Int , completion :@escaping Handler) {
        
        
        var Hospitalid = 1
               if ((HospitaLlists.currenHospital()?.id!) != nil) {
                  
                   
                   Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                   
                   
                   
               }
               
               
               
               else {
                   
                   
                   Hospitalid = 1
                   
                   
               }
        
        
        let uar =  "Lookup/GetAllAdmissionPLaces?DoctorID=\(Tokendoctor)&HospitalID=\(Hospitalid)"
        
        
        
        
        
        
        
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: AdmissionPLaces(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    class func GetAllAdmissionForms(completion :@escaping Handler) {
        
        
        var Hospitalid = 1
               if ((HospitaLlists.currenHospital()?.id!) != nil) {
                  
                   
                   Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                   
                   
                   
               }
               
               
               
               else {
                   
                   
                   Hospitalid = 1
                   
                   
               }
        
        
        let uar =  "Lookup/GetAllAdmissionForms?HospitalID=\(Hospitalid)"
        
        
        
        
        
        
        
        
        
         APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: AdmissionForms(), completionHandler: completion)
        
        
        
        
    }
    
    
    
   
    
    
    
    class func GetAllAdmissionDoctors(completion :@escaping Handler) {
        
        
        var Hospitalid = 1
               if ((HospitaLlists.currenHospital()?.id!) != nil) {
                  
                   
                   Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                   
                   
                   
               }
               
               
               
               else {
                   
                   
                   Hospitalid = 1
                   
                   
               }
        
        
        let uar =  "Lookup/GetAllDoctors?HospitalID=\(Hospitalid)"
        
        
        
        
        
        
        
        
        
         APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: AdmissionForms(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    class func doctorPAtientrequsted(Tokendoctor : Int , completion :@escaping Handler) {
           
           
           var Hospitalid = 0
                  Hospitalid = (HospitaLlists.currenHospital()?.id!)!
           
           
           let uar =  "Doctor/PatientTest?DoctorID=\(Tokendoctor)&DepartmentID=40&HospitalID=\(Hospitalid)"
           
           
           
           
           
           
           
           
           
           APIClient.request3(path: uar, method: .get, params: ["":""], headers: nil ,model: DocotrTestlistReq(), completionHandler: completion)
           
           
           
           
       }
    
    
    
    
    
    class func CurrentListcdoctor( Tokendoctor : Int , completion :@escaping Handler) {
        
       
        
        var Hospitalid = 0
       Hospitalid = (HospitaLlists.currenHospital()?.id!)!

        
        let uar = "Doctor/CurrentPatients?DoctorID=\(Tokendoctor)&HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: DoctorDataList(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    
    class func oldListcdoctor( Tokendoctor : Int , completion :@escaping Handler) {
        
        
        
         var Hospitalid = 0
               Hospitalid = (HospitaLlists.currenHospital()?.id!)!

        
        let uar = "Doctor/OldPatients?DoctorID=\(Tokendoctor)&HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: DoctorDataList(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    
    class func Newpatientscdoctor ( Tokendoctor : Int , completion :@escaping Handler) {
        
        
        
         var Hospitalid = 0
         Hospitalid = (HospitaLlists.currenHospital()?.id!)!

        
        let uar = "Doctor/Newpatients?DoctorID=\(Tokendoctor)&HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: DoctorDataList(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    class func libartorypataint( Tokenoataiant : Int , completion :@escaping Handler) {
        
        var Hospitalid = 1
               if ((HospitaLlists.currenHospital()?.id!) != nil) {
                  
                   
                   Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                   
                   
                   
               }
               
               
               
               else {
                   
                   
                   Hospitalid = 1
                   
                   
               }

        
        
        let uar = "Doctor/PatientTest?PinNo=\(Tokenoataiant)&DepartmentID=40&HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: Testlist(), completionHandler: completion)
        
        
        
        
    }
    
    
    //
    class func Radiopataint ( Tokenoataiant : Int , completion :@escaping Handler) {
        
        
        var Hospitalid = 1
               if ((HospitaLlists.currenHospital()?.id!) != nil) {
                  
                   
                   Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                   
                   
                   
               }
               
               
               
               else {
                   
                   
                   Hospitalid = 1
                   
                   
               }

        
        let uar = "Doctor/PatientTest?PinNo=\(Tokenoataiant)&DepartmentID=43&HospitalID=\(Hospitalid)"
        
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: Testlist(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    class func Radiolist (Search : String,completion :@escaping Handler) {
        
        
        
        
        
        var Hospitalid = 1
               if ((HospitaLlists.currenHospital()?.id!) != nil) {
                  
                   
                   Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                   
                   
                   
               }
               
               
               
               else {
                   
                   
                   Hospitalid = 1
                   
                   
               }
        
        
        
        
        let uar = "Lookup/RadiologyList?search=\(Search)&HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: labTestDoctorlist(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    class func Procdeurelist (Search : String,completion :@escaping Handler) {
          
          
          
          
          
          var Hospitalid = 1
                 if ((HospitaLlists.currenHospital()?.id!) != nil) {
                    
                     
                     Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                     
                     
                     
                 }
                 
                 
                 
                 else {
                     
                     
                     Hospitalid = 1
                     
                     
                 }
          
          
          
          
          let uar = "Lookup/OtherProcedureList?Search=\(Search)&HospitalID=\(Hospitalid)"
          
          
          APIClient.request3(path: uar, method: .get, params: ["":""], headers: nil ,model: labTestDoctorlist(), completionHandler: completion)
          
          
          
          
      }
      
      
    
    
    
    
    class func Hospitallist (completion :@escaping Handler) {
           
           
           
           
           
          

           
           
           
           
           let uar = "login/GetAllHospitals"
           
           
           APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: HospitaLlists(), completionHandler: completion)
           
           
           
           
       }
    
    
    
    
    
    
    
    class func Duarationlist (completion :@escaping Handler) {
          
          
          
          
           var Hospitalid = 1
        if ((HospitaLlists.currenHospital()?.id!) != nil) {
           
            
            Hospitalid = (HospitaLlists.currenHospital()?.id!)!
            
            
            
        }
        
        
        
        else {
            
            
            Hospitalid = 1
            
            
        }

          
          
          
          
          
          let uar = "Lookup/DurationList?HospitalID=\(Hospitalid)"
          
          
       APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: Duarationlistobj(), completionHandler: completion)
                 
          
          
          
          
      }
    
    
    
    class func DrugListsapi (Search : String,completion :@escaping Handler) {
        
        
        
         var Hospitalid = 0
               Hospitalid = (HospitaLlists.currenHospital()?.id!)!

        
        
        
        
        
        
        let uar = "Lookup/DrugItems?search=\(Search)&HospitalID=\(Hospitalid)"
        
        
        APIClient.request3(path: uar, method: .get, params: ["":""], headers: nil ,model: DrugLists(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    class func FreeqListsapi (completion :@escaping Handler) {
           
           
           
           var Hospitalid = 1
                  if ((HospitaLlists.currenHospital()?.id!) != nil) {
                     
                      
                      Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                      
                      
                      
                  }
                  
                  
                  
                  else {
                      
                      
                      Hospitalid = 1
                      
                      
                  }

           
           
           
           
           
           
           let uar = "Lookup/FrequancyList?HospitalID=\(Hospitalid)"
           
           
           APIClient.request3(path: uar, method: .get, params: ["":""], headers: nil ,model: Frequncylist(), completionHandler: completion)
           
           
           
           
       }
    
    
    
    
    class func Routeadminsapi(completion :@escaping Handler) {
        
        
        var Hospitalid = 1
               if ((HospitaLlists.currenHospital()?.id!) != nil) {
                  
                   
                   Hospitalid = (HospitaLlists.currenHospital()?.id!)!
                   
                   
                   
               }
               
               
               
               else {
                   
                   
                   Hospitalid = 1
                   
                   
               }
        
        
        
        
        
        
        
        let uar = "Lookup/RoutOfAdminList?HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: RouteAdminLIst(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    class func labListsapi (Search : String,completion :@escaping Handler) {
        
        
        
        
        
        var Hospitalid = 0
               Hospitalid = (HospitaLlists.currenHospital()?.id!)!
        
        
        
        
        let uar = "Lookup/TestList?search=\(Search)&HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: labTestDoctorlist(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    class func DiagonsisListsapi (Search : String,completion :@escaping Handler) {
           
           
           
           
           var Hospitalid = 0
                  Hospitalid = (HospitaLlists.currenHospital()?.id!)!
           
           
           
           
           
           let uar = "Lookup/Diagnosis?search=\(Search)&HospitalID=\(Hospitalid)"
           
           
           APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: DiagonDoctorlist(), completionHandler: completion)
           
           
           
           
       }
    
    
    
    
    
    
    
    class func Schedulespataint( Tokenoataiant : Int , completion :@escaping Handler) {
        
        var Hospitalid = 0
               Hospitalid = (HospitaLlists.currenHospital()?.id!)!
        
        
        let uar = "Doctor/MySchadual?DoctorID=\(Tokenoataiant)&HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: DoctorDataList(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    
    class func ListVisitpataint( Tokenoataiant : Int , completion :@escaping Handler) {
        
        
        
        var Hospitalid = 0
               Hospitalid = (HospitaLlists.currenHospital()?.id!)!
        
        
        let uar = "Patient/Visits?PinNo=\(Tokenoataiant)&HospitalID=\(Hospitalid)"
        
        
        APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: Visitlist(), completionHandler: completion)
        
        
        
        
    }
    
    
    

    
//    http://130.7.1.22:2021/api/Patient/PatientDiagnosis?VisitID={VisitID}
   
  //http://130.7.1.22:2021/api/Patient/Patientprescription?VisitID={VisitID}

    
    

    
    
    class func PatientDiagonsis( Tokenoataiant : Int , completion :@escaping Handler) {
           
           
           //Patient/PatientDiagnosis?VisitID={VisitID}
        
        var Hospitalid = 0
              Hospitalid = (HospitaLlists.currenHospital()?.id!)!


           
           let uar = "Patient/PatientDiagnosis?VisitID=\(Tokenoataiant)&HospitalID=\(Hospitalid)"
           
           
           APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: Diagonisclist(), completionHandler: completion)
           
           
           
           
       }
    
    
    class func PatientPRecption( Tokenoataiant : Int , completion :@escaping Handler) {
              
              
              //Patient/PatientDiagnosis?VisitID={VisitID}
              //http://130.7.1.22:2021/api/Patient/Patientprescription?VisitID={VisitID}
        
        var Hospitalid = 0
               Hospitalid = (HospitaLlists.currenHospital()?.id!)!
        

              let uar = "Patient/Patientprescription?VisitID=\(Tokenoataiant)&HospitalID=\(Hospitalid)"
              
              
              APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: Precrptionlist(), completionHandler: completion)
              
              
              
              
          }
    
    
    
    class func login( DoctorID : String , Password: String , completion :@escaping Handler) {
        
        
        
        var Hospitalid = 0
               Hospitalid = (HospitaLlists.currenHospital()?.id!)!
        
        
       var uar = "Login/DoctorLogin?HospitalID=\(Hospitalid)"
        
       
        
        
        
        let body = [ "DoctorID": DoctorID,
                     "Password" : Password
            ] as [String : Any]
        
       
     

           

       
        
        
        APIClient.request(path: uar, method: .post, params: body, headers: nil ,model: Doctor(), completionHandler: completion)
        
        
        
        
    }
    
    
    
    class func Searchpatientscdoctor ( Tokenpin : Int , completion :@escaping Handler) {
          
          
          
           var Hospitalid = 0
           Hospitalid = (HospitaLlists.currenHospital()?.id!)!

          
          let uar = "Doctor/PatientByPin?PinNo=\(Tokenpin)&HospitalID=\(Hospitalid)"
          
          
          APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: DoctorDataList(), completionHandler: completion)
          
          
          
          
      }
      
    
    
    
    
    
    //http://130.7.1.22:2021{PinNo}
    
    
    
    class func doctorReFerrals(Tokendoctor : Int , completion :@escaping Handler) {
           
           
           var Hospitalid = 0
                  Hospitalid = (HospitaLlists.currenHospital()?.id!)!
           
           
        
        
        
           let uar =  "Doctor/PatientReferral/?DoctorID=\(Tokendoctor)&HospitalID=\(Hospitalid)"
           
           
           
           
           
           
           
           
           
           APIClient.request(path: uar, method: .get, params: ["":""], headers: nil ,model: ReFerralsList(), completionHandler: completion)
           
           
           
           
       }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}



