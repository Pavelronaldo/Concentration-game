//
//  ViewController.swift
//  Concentration
//
//  Created by Pavel Ronaldo on 4/11/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var сardButtons: [UIButton]! /// зачем в конце знак !  ??
    
    var emojiChoices = ["🎃","👻","🎃","👻"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = сardButtons.index(of: sender) {
        flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            
            } else {
            print ("Chosen card was not in card button")
        }
        
        }
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipCard(withEmoji: \(emoji))")

        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
             button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
        }
}
}
