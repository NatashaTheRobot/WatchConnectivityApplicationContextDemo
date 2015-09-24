//
//  LabelTableViewCell.swift
//  WCApplicationContextDemo
//
//  Created by Natasha Murashev on 9/20/15.
//  Copyright © 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {

    @IBOutlet weak private var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withText text: String) {
        label.text = text
    }

}
