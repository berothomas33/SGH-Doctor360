import UIKit
import ObjectMapper


class Precrptionlist : Mappable {
    
    var visitID: Int?
    
    var visitDateTime: String?
    
    var doctorID: Int?
   
    var drugCode: String?
    
    var drugName: String?
    
    var duration: String?
    
    var beforeAfter: String?
    
    var strength: String?
    
    var frequancy: String?
    
    var remarks: String?
    
    var registrationNo: Int?
    
    
    
    

    init() {}
    required init?(map : Map){}



    func mapping(map : Map){
        
       visitID <- map["VisitID"]
       visitDateTime <- map["VisitDateTime"]
    doctorID <- map["DoctorID"]
      drugCode <- map["DrugCode"]
       drugName <- map["DrugName"]
      duration <- map["Duration"]
        beforeAfter <- map["BeforeAfter"]
       strength <- map["Strength"]
      frequancy <- map["Frequancy"]
       remarks <- map["Remarks"]
       registrationNo <- map["RegistrationNo"] 
        
        
        
        
    }

}
