
import UIKit
import ObjectMapper




class Visitlist : Mappable {
    var visitID: Int? 
    var patientName: String? 
    var sex: String? 
    
    var company: String? 
    var dateOfBirth: String? 
    var regDateTime: String? 
    var registrationno: Int? 
    var maritalStatusEnglish: String? 
    
    var maritalStatusArabic: String? 
    var patientPhone: String? 
    var countryEnglish: String? 
    var countryArabic: String? 
    var cityEnglish: String? 
    var cityArabic: String? 
    var visitDateTime: String? 
    
    
    
    
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        
        
        visitID <- map["VisitID"]
        
        patientName <- map["PatientName"]
        
        sex <- map["Sex"]
        
        cityArabic <- map["CityArabic"]
        
        company <- map["Company"]
        
        company <- map["Company"]
        
        countryEnglish  <- map["CountryEnglish"]
        
        regDateTime <- map["RegDateTime"]
        
        
        maritalStatusEnglish <- map["MaritalStatusEnglish"]
        
        maritalStatusArabic <- map["MaritalStatusArabic"]
        
        countryArabic <- map["CountryArabic"]
        
        dateOfBirth <- map["DateOfBirth"]
        
        patientPhone <- map["PatientPhone"]
        
        visitDateTime <- map["VisitDateTime"]
        
        registrationno <- map["Registrationno"]
        
        
        cityEnglish <- map["CityEnglish"]
    }
    
}
