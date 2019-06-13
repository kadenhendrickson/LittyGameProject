//
//  SettingsStackViewColor.swift
//  LittyGameProject
//
//  Created by Jordan Hendrickson on 6/13/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class SettingsStackViewColor: UIStackView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addBackground(color: .stackViewGrayBackgroundColor)
        setupUI()
    }
    
    func setupUI() {
        self.addGrayStackViewBorderColor()
    }
}

    extension UIStackView {
        func addBackground(color: UIColor) {
            let subView = UIView(frame: bounds)
            subView.backgroundColor = color
            subView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
            insertSubview(subView, at: 0)
        }
    }


