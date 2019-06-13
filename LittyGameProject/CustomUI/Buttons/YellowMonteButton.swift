//
//  YellowMonteButton.swift
//  LittyGameProject
//
//  Created by Jordan Hendrickson on 6/13/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class YellowMonteButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI(){
        self.addCornerRadius()
        self.addYellowButtonBorderColor()
    }

}
