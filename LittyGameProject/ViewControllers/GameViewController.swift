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
    var cardAnimationComplete: Bool  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slotOne = buttonOneImageView.frame.origin
        slotTwo = queenImageView.frame.origin
        slotThree = buttonThreeImageView.frame.origin
        buttonOneImageView.isEnabled = false
        queenImageView.isEnabled = false
        buttonThreeImageView.isEnabled = false
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func moveCardsButtonTapped(_ sender: Any) {
        cardAnimationComplete = false
        numberOfShuffles = 10
        animateCards(animationSpeed: 0.25)
        print("I ran")
    }
    
    @IBAction func cardButtonTapped(_ sender: UIButton) {
        print(cardAnimationComplete)
        if cardAnimationComplete {
            switch sender {
            case buttonOneImageView:
                disableButtons()
                print("You tapped the first card: You lose!")
                gameStatusTextLabel.text = "You Lost! Play again!"
                presentAlertController()
            case queenImageView:
                disableButtons()
                print("You tapped the queen card: You Win!")
                gameStatusTextLabel.text = "You Won! Play again!"
                presentAlertController()
            case buttonThreeImageView:
                disableButtons()
                print("You tapped the third card: You lose!")
                gameStatusTextLabel.text = "You Lost! Play again!"
                presentAlertController()
            default:
                print("How on earth did you find a fourth card?")
            }
        }
        
        
    }
    
    func animateCards(animationSpeed: TimeInterval) {
        disableButtons()
        var slots = [slotOne, slotTwo, slotThree].shuffled()
        
        UIView.animate(withDuration: animationSpeed,
                       delay: 0,
                       options: [], animations: {
                        self.buttonOneImageView.frame.origin = slots[0];
                        self.queenImageView.frame.origin = slots[1];
                        self.buttonThreeImageView.frame.origin = slots[2];
        }, completion: { (_) in
            if self.numberOfShuffles > 0 {
                self.numberOfShuffles -= 1
                self.animateCards(animationSpeed: animationSpeed)
                print("animated \(self.numberOfShuffles) times")
            } else {
                self.enableButtons()
                self.cardAnimationComplete = true
            }
        })
    }
    
    func disableButtons() {
        buttonOneImageView.isEnabled = false
        queenImageView.isEnabled = false
        buttonThreeImageView.isEnabled = false
    }
    func enableButtons() {
        self.buttonOneImageView.isEnabled = true
        self.queenImageView.isEnabled = true
        self.buttonThreeImageView.isEnabled = true
    }
    func setSlots() {
        slotOne = buttonOneImageView.frame.origin
        slotTwo = queenImageView.frame.origin
        slotThree = buttonThreeImageView.frame.origin
    }
    func presentAlertController() {
        let alertController = UIAlertController(title: "Play again?", message: "come on man, you know you wanna play again", preferredStyle: .alert)
        let playAgainAction = UIAlertAction(title: "Reset Cards", style: .default) { (_) in
            self.buttonOneImageView.frame.origin = self.slotOne
            self.queenImageView.frame.origin = self.slotTwo
            self.buttonThreeImageView.frame.origin = self.slotThree
        }
        
        alertController.addAction(playAgainAction)
        self.present(alertController, animated: true)
    }

}
