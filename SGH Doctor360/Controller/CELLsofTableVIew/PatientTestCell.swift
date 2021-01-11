//
//  PatientTestCell.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/2/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class PatientTestCell: UITableViewCell {

    
    var ShowPDFname : (()->())?
    
    var expermient = "experiment"
     var expermient2 = "xray"
    var sellyFLAg = ""
    var  bill = "bill"
    
    var brithday = "birthday"
    var date = "date"
    @IBAction func ShowPDF(_ sender: Any) {
        
        ShowPDFname?()
    }
    
    
    @IBOutlet var circular: UIImageView!
    
    @IBOutlet var NameofTEst: Customtextlabel!
    @IBOutlet var DAteofBoking: Customtextlabel!
    @IBOutlet var NameofPatient: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
       
        
        
       
        
        
        
        
        
        
        
        
        
        
        self.DAteofBoking.setimage(person: date)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        
        
        
        // Configure the view for the selected state
    }
    
}
