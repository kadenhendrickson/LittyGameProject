//
//  File.swift
//  LittyGameProject
//
//  Created by Jordan Hendrickson on 6/13/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

extension UIView {
    func addCornerRadius(radius: CGFloat = 7) {
        self.layer.cornerRadius = radius
    }
    func addRedButtonBorderColor(width: CGFloat = 3 , color: UIColor = UIColor.borderHighlightRed) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    func addBlueButtonBorderColor(width: CGFloat = 3 , color: UIColor = UIColor.borderHighlightBlue) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    func addGreenButtonBorderColor(width: CGFloat = 3 , color: UIColor = UIColor.borderHighlightGreen) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    func addYellowButtonBorderColor(width: CGFloat = 3 , color: UIColor = UIColor.borderHighlightYellow) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    func addGrayButtonBorderColor(width: CGFloat = 3 , color: UIColor = UIColor.borderHighlightGray) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    func addGrayStackViewBorderColor(width: CGFloat = 12 , color: UIColor = UIColor.borderHighlightGray) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
}
extension UIColor {
    static let borderHighlightRed = UIColor(named: "RedButtonBorderColor")!
    static let borderHighlightBlue = UIColor(named: "BlueButtonBorderColor")!
    static let borderHighlightGreen = UIColor(named: "GreenButtonBorderColor")!
    static let borderHighlightYellow = UIColor(named: "YellowButtonBorderColor")!
    static let borderHighlightGray = UIColor(named: "GrayButtonBorderColor")!
    static let grayBackGroundColor = UIColor(named: "GrayMonteButtonBackgroundColor")!
    static let stackViewGrayBackgroundColor = UIColor(named: "StackViewGrayBackgroundColor")!

}
