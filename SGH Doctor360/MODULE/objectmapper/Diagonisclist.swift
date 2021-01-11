import UIKit
import ObjectMapper


class Diagonisclist : Mappable {
    
    var visitID: Int?
    
    var visitDateTime: String?
    
    var doctorID: Int?
    
    var provDiagnosis: String?
    
    var finalDiagnosis: String?
    
    var fixedDiagnoses: String?
    
    var otherAdvice: String?
   
    var registrationNo: Int?



init() {}
required init?(map : Map){}



func mapping(map : Map){



visitID <- map["VisitID"]
    
   visitDateTime <- map["VisitDateTime"]
    
   doctorID <- map["DoctorID"]
    
   provDiagnosis <- map["ProvDiagnosis"]
    
   finalDiagnosis <- map["FinalDiagnosis"]
   
  fixedDiagnoses  <- map["FixedDiagnoses"]
   
   otherAdvice <- map["OtherAdvice"]
   
     registrationNo <- map["RegistrationNo"]
    



}



}
