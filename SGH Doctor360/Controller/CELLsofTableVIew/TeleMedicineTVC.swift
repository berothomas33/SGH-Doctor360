//
//  TeleMedicineTVC.swift
//  DoctorApp
//
//  Created by ebram thomas on 6/24/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class TeleMedicineTVC: UITableViewCell {

    @IBOutlet var telemedicine: UIButton!
    @IBOutlet var dateofpatient: UILabel!
    @IBOutlet var NameofPAtient: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
