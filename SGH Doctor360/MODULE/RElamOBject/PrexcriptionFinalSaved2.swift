//
//  PrexcriptionFinalSaved2.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/9/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//


import Foundation

import RealmSwift


class PrexcriptionFinalSaved2 : Object  {






 @objc dynamic var DrugId = ""

 @objc dynamic var DrugName = ""

 @objc dynamic var Remarks = 0

@objc dynamic var DurationID = " "

  @objc dynamic var StrengthNo = 0.0

@objc dynamic var Strength = " "

@objc dynamic var Duration = " "

@objc dynamic var BeforeAfter = " "
    
    @objc dynamic var Qty = " "


@objc dynamic var Frequancy = " "
    
    
    @objc dynamic var Max = 1
    
    @objc dynamic var Stock = 1



@objc dynamic var Duration_No = 0


@objc dynamic var RouteOfAdmin = " "


@objc dynamic var FrequencyID = " "
    
    
    
    
    override class func primaryKey() -> String? {
              return "DrugId"
          }
    
    convenience init?(DrugName : String,DrugId : String , Remarks:Int, DurationID : String,  StrengthNo : Double , Strength :  String  ,  Duration : String , BeforeAfter : String , Frequancy :String  , Duration_No : Int  , RouteOfAdmin : String , FrequencyID : String,Qty:String , MAx : Int , Stock : Int) {


          

                  self.init()

                  self.DrugId = DrugId
         self.Remarks = Remarks
                  self.DurationID = DurationID
                  self.StrengthNo = StrengthNo
                 
        self.Strength = Strength
        self.Duration = Duration
        self.BeforeAfter = BeforeAfter
        self.Frequancy = Frequancy
 self.Duration_No = Duration_No
        self.RouteOfAdmin = RouteOfAdmin
        self.FrequencyID = FrequencyID
        self.Qty = Qty
        self.DrugName = DrugName
        self.Max = MAx
        self.Stock = Stock

       }
    
    
}



