//
//  VisitCell.swift
//  DoctorApp
//
//  Created by ebram thomas on 5/3/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class VisitCell: UITableViewCell {

    
      var ShowVisit : (()->())?
    
    @IBOutlet var VisitID: UILabel!
    
   
    @IBOutlet var VisitDatetime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
   
    @IBAction func ActionDEtaila(_ sender: Any) {
        
        ShowVisit?()
        
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
