//
//  ReFellSTVCells.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/21/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class ReFellSTVCells: UITableViewCell {
    
    
    
    var ShowPDFname : (()->())?
    
    var expermient = "experiment"
    
    var  bill = "bill"
    
    var brithday = "birthday"
    var date = "date"

    
    @IBOutlet var Refells: Customtextlabel!
       @IBOutlet var DAteofBoking: Customtextlabel!
       @IBOutlet var NameofPatient: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.Refells.setimage(person: expermient)
              
              
              self.DAteofBoking.setimage(person: date)
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
