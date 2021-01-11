//
//  LabResulautTCell.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/7/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class LabResulautTCell: UITableViewCell {

    
    
     var SetDElete : (() -> ())?
    
    
    
    
      @IBOutlet var NameofDrugs: UILabel!
    
    @IBOutlet var Delete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func Function(_ sender: Any) {
        
        self.SetDElete!()
        
    }
}
