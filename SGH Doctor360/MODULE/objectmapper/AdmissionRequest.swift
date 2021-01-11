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


class AdmissionRequest: Mappable {
    var Admittedform = 0
    var Admissionstatus = ""
    var procedure = 0
    
    //var plannedDate : Data
    var stay = 0
    var Admissionplace = 0
    var AdmittingDoctor = 0
    var TreatmentDoctor = 0
    var ClinicalRemarks = 0
    var TreatmentPlan = ""
    var Notes = ""
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
    
    
    
    
    func mapping(map: Map) {
        
        Admittedform  <- map["Admittedform"]
        Admissionstatus  <- map["Admissionstatus"]
        procedure  <- map["procedure"]
        
      //  plannedDate  <- map["plannedDate"]
        
        stay  <- map["stay"]
        Admissionplace  <- map["Admissionplace"]
        AdmittingDoctor  <- map["AdmittingDoctor"]
        TreatmentDoctor  <- map["TreatmentDoctor"]
        ClinicalRemarks  <- map["ClinicalRemarks"]
        TreatmentPlan  <- map["TreatmentPlan"]
        Notes  <- map["Notes"]
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


