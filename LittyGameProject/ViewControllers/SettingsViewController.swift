//
//  SettingsViewController.swift
//  LittyGameProject
//
//  Created by Kaden Hendrickson on 6/12/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    static let shared = SettingsViewController()
    
    var cardBackColor: UIImage = UIImage(named: "redCardBack") ?? UIImage()
    var shuffleSpeed: TimeInterval = 0.75
    
    @IBOutlet weak var blueCardButton: BlueMonteButton!
    @IBOutlet weak var greenCardButton: GreenMonteButton!
    @IBOutlet weak var yellowCardButton: YellowMonteButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeColorButtonsTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            SettingsViewController.shared.cardBackColor = UIImage(named: "blueCardBack") ?? UIImage()
            self.navigationController?.popViewController(animated: true)
            print("card color changed to blue")
        case 2:
            SettingsViewController.shared.cardBackColor = UIImage(named: "greenCardBack") ?? UIImage()
            self.navigationController?.popViewController(animated: true)
            print("card color changed to green")
        case 3:
            SettingsViewController.shared.cardBackColor = UIImage(named: "yellowCardBack") ?? UIImage()
            self.navigationController?.popViewController(animated: true)
            print("card color changed to yellow")
        default:
            print("damn brother impressive")
        }
    }
    
    @IBAction func difficultyButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            SettingsViewController.shared.shuffleSpeed = 1.0
            self.navigationController?.popViewController(animated: true)
        case 2:
            SettingsViewController.shared.shuffleSpeed = 0.75
            self.navigationController?.popViewController(animated: true)
        case 3:
            SettingsViewController.shared.shuffleSpeed = 0.5
            self.navigationController?.popViewController(animated: true)
        case 4:
            SettingsViewController.shared.shuffleSpeed = 0.25
            self.navigationController?.popViewController(animated: true)
        default:
            print("this is broken if it hits this point")
        }
    }
    

}
