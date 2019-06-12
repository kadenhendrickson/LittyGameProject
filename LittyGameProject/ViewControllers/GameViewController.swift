//
//  GameViewController.swift
//  LittyGameProject
//
//  Created by Kaden Hendrickson on 6/12/19.
//  Copyright © 2019 DevMountain. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var buttonOneImageView: UIButton!
    @IBOutlet weak var queenImageView: UIButton!
    @IBOutlet weak var buttonThreeImageView: UIButton!
    
    
    var slotOne: CGPoint = .zero
    var slotTwo: CGPoint = .zero
    var slotThree: CGPoint = .zero
    var numberOfShuffles = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slotOne = buttonOneImageView.frame.origin
        slotTwo = queenImageView.frame.origin
        slotThree = buttonThreeImageView.frame.origin
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func moveCardsButtonTapped(_ sender: Any) {
        numberOfShuffles = 10
        animateCards(animationSpeed: 0.5)
        print("I ran")
        
        
        
    }
    
    func animateCards(animationSpeed: TimeInterval) {
        var slots = [slotOne, slotTwo, slotThree].shuffled()
        
        UIView.animate(withDuration: animationSpeed,
                       delay: 0,
                       options: [], animations: {
                        self.buttonOneImageView.frame.origin = slots[0];
                        self.queenImageView.frame.origin = slots[1];
                        self.buttonThreeImageView.frame.origin = slots[2];
                        
        }, completion: { (_) in
            if self.numberOfShuffles >= 0 {
                self.animateCards(animationSpeed: animationSpeed)
                print("animated \(self.numberOfShuffles) times")
            }
            self.numberOfShuffles -= 1
            
        })
    }
    
    

}
