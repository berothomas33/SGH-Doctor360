//
//  TestCell.swift
//  DoctorApp
//
//  Created by ebram thomas on 4/30/20.
//  Copyright © 2020 ebram thomas. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {
    
    
    var ShowPDFname : (()->())?

    
    
    @IBOutlet var Showpdf: UIButton!
    @IBOutlet var NameOfTest: UILabel!
    
    @IBOutlet var DateofTesting: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func ShowPDF(_ sender: Any) {
        
        ShowPDFname?()
    }
    
    
    
}
