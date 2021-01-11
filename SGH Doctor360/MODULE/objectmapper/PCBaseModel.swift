



import UIKit
import ObjectMapper


class PCBaseModel: Mappable {
    var code = 0
    var message = ""
    var content : [String:Any]?
    var content2 : Any = [:]
    
    init() {}
    required init?(map: Map) {
        
    }
    
    
    
    
    func mapping(map: Map) {
        code <- map["HttpStatusCode"]
        message <- map["Message"]
        content <- map["Data"]
        content2 <- map["DataList"]
    }
    
    
}


