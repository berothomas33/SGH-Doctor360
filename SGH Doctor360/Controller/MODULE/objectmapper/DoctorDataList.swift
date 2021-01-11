import UIKit
import ObjectMapper

class DoctorDataList : Mappable {
    
    
    var patientName : String?
    
    var sex : String?
    
    var company : String?
    
    var dateOfBirth : String?
    
    var regDateTime : String?
    
    var registrationno: Int?
    
    var maritalStatusEnglish : String?
    
    var maritalStatusArabic : String?
    
    var patientPhone : String?
    
    var countryEnglish : String?
    
    var countryArabic : String?
    
    var cityEnglish : String?
    
    var cityArabic : String?
    
    var dateOfBooking : String?
    
    var address : String?
    
    var patientStatus : String?
    
    var VisitDateTime : String?
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        
        patientName <- map["PatientName"]
        sex <- map["Sex"]
        company <- map["Company"]
        dateOfBirth <- map["DateOfBirth"]
        regDateTime <- map["RegDateTime"]
        registrationno <- map["Registrationno"]
        maritalStatusEnglish <- map["MaritalStatusEnglish"]
        maritalStatusArabic <- map["MaritalStatusArabic"]
        patientPhone <- map["PatientPhone"]
        countryEnglish <- map["CountryEnglish"]
        countryArabic <- map["CountryArabic"]
        cityEnglish <- map["CityEnglish"]
        cityArabic <- map["CityArabic"]
        dateOfBooking <- map["DateOfBooking"]
        address <- map["Address"]
        patientStatus <- map["PatientStatus"]
         VisitDateTime <- map["VisitDateTime"]
        
    }
    
}
