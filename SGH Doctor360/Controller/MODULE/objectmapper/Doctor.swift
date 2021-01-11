import UIKit
import ObjectMapper

class Doctor : Mappable {
    
    
    var id = 0
    
    var employeeID: String?
    
    
    
    var phone: String?
    
    var email: String?
    
    var empCode: String?
    
    var doctorEnglishName: String?
    
    var doctorArabicName: String?
    
    var dob: String?
    
    var englishSex: String?
    
    var arabicSex: String?
    
    var age: Int?
    
    var departmentEnglishName: String?
    
    var departmentArabicName: String?
    
    var designationEnglishName: String?
    
    var designationArabicName: String?
    
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        
        
        
        
        id <- map["ID"]
        employeeID <- map["EmployeeID"]
        
        
        phone <- map["Phone"]
        email  <- map["Email"]
        empCode <- map["EmpCode"]
        doctorEnglishName <- map["DoctorEnglishName"]
        doctorArabicName  <- map["DoctorArabicName"]
        dob <- map["DOB"]
        englishSex  <- map["EnglishSex"]
        arabicSex <- map["ArabicSex"]
        age  <- map["Age"]
        departmentEnglishName  <- map["DepartmentEnglishName"]
        departmentArabicName <- map["DepartmentArabicName"]
        designationEnglishName  <- map["DesignationEnglishName"]
        designationArabicName   <- map["DesignationArabicName"]
        
        
    }
    
    
    
    
    
    
     func save()  {
        Cache.set(object: self.toJSON(), forKey: "CurrentUser")
    }
    func remove()  {
        Cache.removeObject(key: "CurrentUser")
        
    }
    
    
    // return object from cashe(user defaulat)
    class func currentUser() -> Doctor? {
        if let json = Cache.object(key: "CurrentUser") as? [String:Any] {
            
            return Mapper<Doctor>().map(JSON: json)
        }
        return nil
    }
    
    
}
