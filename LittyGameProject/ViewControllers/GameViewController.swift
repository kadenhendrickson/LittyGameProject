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
    @IBOutlet weak var gameStatusTextLabel: UILabel!
    
    
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
        animateCardFlipToBack()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.animateCardShuffle(animationSpeed: 0.5)
        }
        print("I ran")
    }
    
    @IBAction func cardButtonTapped(_ sender: UIButton ) {
        print(cardAnimationComplete)
        if cardAnimationComplete {
            switch sender {
            case buttonOneImageView:
                disableButtons()
                print("You tapped the first card: You lose!")
                gameStatusTextLabel.text = "You Lost! Play again!"
                buttonOneImageView.setImage(UIImage(named: "queenOfHearts"), for: .normal)
            case queenImageView:
                disableButtons()
                print("You tapped the queen card: You Win!")
                gameStatusTextLabel.text = "You Won! Play again!"
                queenImageView.setImage(UIImage(named: "queenOfSpades"), for: .normal)
            case buttonThreeImageView:
                disableButtons()
                print("You tapped the third card: You lose!")
                gameStatusTextLabel.text = "You Lost! Play again!"
                buttonThreeImageView.setImage(UIImage(named: "queenOfHearts"), for: .normal)
            default:
                print("How on earth did you find a fourth card?")
            }
        }
        
        
    }
    
    func animateCardShuffle(animationSpeed: TimeInterval) {
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
                self.animateCardShuffle(animationSpeed: animationSpeed)
                print("animated \(self.numberOfShuffles) times")
            } else {
                self.enableButtons()
                self.cardAnimationComplete = true
            }
        })
    }
    func animateCardFlipToBack() {
        self.buttonOneImageView.setImage(UIImage(named: "redCardBack"), for: .normal)
        self.queenImageView.setImage(UIImage(named: "redCardBack"), for: .normal)
        self.buttonThreeImageView.setImage(UIImage(named: "redCardBack"), for: .normal)
        
    }
    
    func animateCardFlipToFront(card: UIButton) {
        switch card{
        case buttonOneImageView:
            buttonOneImageView.setImage(UIImage(named: "queenOfHearts"), for: .normal)
        case buttonThreeImageView:
            self.buttonThreeImageView.setImage(UIImage(named: "queenOfHearts"), for: .normal)
        case queenImageView:
            self.queenImageView.setImage(UIImage(named: "queenOfSpades"), for: .normal)
        default:
            print("what")
        }
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
}
