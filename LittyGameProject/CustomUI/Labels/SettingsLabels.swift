//
//  SettingsLabels.swift
//  LittyGameProject
//
//  Created by Jordan Hendrickson on 6/13/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class SettingsLabels: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        self.addGrayButtonBorderColor()
    }

}
