


import UIKit
import Alamofire
import  ObjectMapper

typealias Handler = (_ response:Any? ,_ error:String?) -> Void

class APIClient: NSObject {
    
 class func request<T: BaseMappable>( path : String ,method:HTTPMethod, params: [String : Any]? = nil ,headers : HTTPHeaders? = nil,encoding : ParameterEncoding = URLEncoding.default,model : T? ,completionHandler: @escaping Handler)  {
        
        
        let fullPath = Constants.baseUrl + path
        
        let fullParams  = params
        
        var fullHeaders : [String:String] = [:]
        

        
        print("**********************************")
        print("path -> \(fullPath)")
        print("**********************************")
        print("headers -> \(fullHeaders)")
        print("**********************************")
        print("body -> \(fullParams!)")
        print("**********************************")
        
        AF.request(fullPath, method: method ,parameters: fullParams, encoding:encoding, headers: headers).responseJSON { (response) in
            
            // not conneted with server handle error
            if (response.error != nil) || response.response?.statusCode != 200 {
                completionHandler(nil, response.error?.localizedDescription)
                print("****************\(response.error?.localizedDescription)********************")
                return
            }
            
          
            
            switch response.response?.statusCode {
            case 200?:
                self.mapResopnse(response: response, model: model, completionHandler: completionHandler)
                break
           
            default:
                completionHandler(nil, "error \(String(describing: response.response?.statusCode))")
                break
            }
            
        }
        
    }
    
    
    
    
    
    
  class func request2( path : String ,method:HTTPMethod, params: [String : Any]? = nil ,headers : HTTPHeaders? = nil, encoding : JSONEncoding = JSONEncoding.default,completionHandler: @escaping Handler)  {
         
         
         let fullPath = Constants.baseUrl + path
         
         let fullParams  = params
         
    
         
         print("**********************************")
         print("path -> \(fullPath)")
         print("**********************************")
         print("headers -> \(headers)")
         print("**********************************")
         print("body -> \(fullParams!)")
         print("**********************************")
         
         AF.request(fullPath, method: method ,parameters: fullParams, encoding:encoding, headers: headers).responseJSON { (response) in
             
          
             if (response.error != nil)  {
                 completionHandler(nil, response.error?.localizedDescription)
                 
                 
                 print(response)
                                print("****************\(response.error?.localizedDescription)********************")
                 
                 
                
//                let errorty = "Password field is not vaild && dont contain on Capital and small character and number or not > 6  "
                
                
                
//                                       self.view.makeToast(errorty , duration: 2.0, position: .center)
                
                
                
                
                
                
                
                 return
             } else {
                 
                 print(response.value!)
                 guard let json = response.value as? [String : Any] else {
                     completionHandler(nil,"" )
                     return
                 }
                 
                 print(response)
                 let user = Mapper<PCBaseModel>().map(JSON : json)
                 
                 completionHandler(Mapper<PCBaseModel>().map(JSON : json),"")
                 // let baseModel = Mapper<response>().map(JSON : json)
                 
                 // completionHandler(Mapper<T>().map(JSON : T),"")
                 
                 
                 
                 /*
                  if let array = baseModel?.content as? [[String : Any]] {
                  completionHandler(Mapper<T>().mapArray(JSONArray: array),"")
                  } else if let map =  baseModel?.content as? [String : Any] {
                  completionHandler(Mapper<T>().map(JSON : map),"")
                  } else {
                  completionHandler(baseModel?.content,"" )
                  }
                  */
                 
                 
                 
                 
             }
             
             // handle server respone
             /*
              switch response.response?.statusCode {
              case 200?:
              self.mapResopnse(response: response, model: model, completionHandler: completionHandler)
              break
              
              default:
              completionHandler(nil, "error \(String(describing: response.response?.statusCode))")
              break
              }
              */
         }
         
     }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    static func mapResopnse<T: BaseMappable>(response : AFDataResponse<Any> ,model : T?,completionHandler: @escaping Handler ) {
        
        
        guard let json = response.value as? [String : Any] else {
            completionHandler(nil,"" )
            return
        }
       
       
        let baseModel = Mapper<PCBaseModel>().map(JSON : json)
        
        
        
        if baseModel?.code == 1 || baseModel?.code == 200   {
            
         
                
               
//                if (baseModel?.content2 != nil  ) {
//
//
//
//  if let array = baseModel?.content2 as? [[String : Any]] {
//                                                           completionHandler(Mapper<T>().mapArray(JSONArray: array),"")
//                                                       }
//
//
//
//
//
//
//
//
//            }  else if (baseModel?.content != nil ) {
//                     print(json)
//
//                    if let map =  baseModel?.content as? [String : Any] {
//                                                                   completionHandler(Mapper<T>().map(JSON : map),"")
//
//
//                    }
//
//
//            }
         
                
                    
              if let array = baseModel?.content2 as? [[String : Any]] {
                             completionHandler(Mapper<T>().mapArray(JSONArray: array),"")
                         } else if let map =  baseModel?.content as? [String : Any] {
                             completionHandler(Mapper<T>().map(JSON : map),"")
                         } else {
                             completionHandler(baseModel?.content,"" )
                         }
            
            
            

      
            
         
            
            
        } else {
            completionHandler(nil,(baseModel?.message.isEmpty)! ? "error \(baseModel?.code)" : baseModel?.message  )
            
        }
        
    }
    
    
    
   
        
   
    
   
    
    
    
    
    
    
}

    
    
    
    
    
    
    
    
    


