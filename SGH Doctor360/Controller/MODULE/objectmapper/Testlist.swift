import UIKit
import ObjectMapper

class Testlist : Mappable {
    
    
    
    var testID: Int?
    
    var code: String?
    
    var testName: String?
    
    var testNameArabic: String?
    
    var testDateTime: String?
    
    var remarks: String?
    
    var pdFlink: String?
    
    
    
    
    
    
    init() {}
    required init?(map : Map){}
    
    
    
    func mapping(map : Map){
        testID <- map["TestID"]
        
        code <- map["Code"]
        
        testName <- map["TestName"]
        
        testNameArabic <- map["TestNameArabic"]
        
        testDateTime <- map["TestDateTime"]
        
        remarks <- map["Remarks"]
        
        pdFlink <- map["PDFlink"]
        
        
        
    }
    
}
