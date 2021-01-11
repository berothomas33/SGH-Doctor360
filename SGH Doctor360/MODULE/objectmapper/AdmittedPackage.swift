//
//  AdmittedPackage.swift
//  SGH Doctor360
//
//  Created by mac on 12/6/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation
//
//  AdmissionRequest.swift
//  SGH Doctor360
//
//  Created by mac on 12/2/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import Foundation

import UIKit
import ObjectMapper


class AdmittedPackage: Mappable {
    
    var MaxReqularRoom = 0
    var Package = false
    var MaxCriticalRoom = 0
    
    var MaxMedicalsupplies = 0.0
    var WithoutMaxMedicalsupplies = false
    
    
    var MaxLabInvestigation = 0.0
    var WithoutMaxLabInvestigation = false
    
    
    
    var MaxImaging = 0.0
    var WithoutMaxImaging = false
    
    
    
    var MaxMedication = 0.0
    var WithoutMaxMedication = false
    var  Procedurefee = false
    var Orfee = false
    var MedicalandNursing = false
    
    var PinNO =  ""
    var  DoctorId = 0
    var Now = false
    
    var Surgical = false
    
    init() {}
    required init?(map: Map) {
        
        
        
        
        
    }
    
    
    
    
    func toDict() -> [String:Any] {
            var dict = [String:Any]()
            let otherSelf = Mirror(reflecting: self)
            for child in otherSelf.children {
                if let key = child.label {
                    dict[key] = child.value
                }
            }
            return dict
        }
    
    
    
    
    
    
    
    
    
    
    
    func mapping(map: Map) {
        
       
       
        MaxReqularRoom  <- map["MaxReqularRoom"]
        Package <- map["Package"]
        MaxCriticalRoom <- map["MaxCriticalRoom"]
        
        MaxMedicalsupplies <- map["MaxMedicalsupplies"]
        WithoutMaxMedicalsupplies <- map["WithoutMaxMedicalsupplies"]
        
        
        MaxLabInvestigation <- map["MaxLabInvestigation"]
        WithoutMaxLabInvestigation <- map["WithoutMaxLabInvestigation"]
        
        
        MaxImaging <- map["MaxImaging"]
        WithoutMaxImaging <- map["WithoutMaxImaging"]
        
        
        MaxMedication <- map["MaxMedication"]
        WithoutMaxMedication <- map["WithoutMaxMedication"]
        
        Procedurefee <- map["Procedurefee"]
        Orfee <- map["Orfee"]
        MedicalandNursing <- map["MedicalandNursing"]
        PinNO <- map["PinNO"]
        DoctorId <- map["DoctorId"]
        Now <- map["Now"]
        
        
        Surgical <- map["Surgical"]
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
}


